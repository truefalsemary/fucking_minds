import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/app_router.dart';
import 'package:lms_front/features/courses/single_course/domain/current_user_tabs.dart';
import 'package:lms_front/features/courses/single_course/presentation/tab_views/lessons_tab_view.dart';
import 'package:lms_front/features/courses/single_course/presentation/tab_views/rating_tab_view.dart';
import 'package:lms_front/features/courses/single_course/presentation/tab_views/tasks_tab_view.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_cubit.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_state.dart';
import 'package:lms_front/features/shared/presentation/user_profile_button.dart';
import 'package:lms_front/ui_kit/components/tabs/tab_content_wrapper.dart';
import 'package:lms_front/ui_kit/components/tabs/tab_wrapper.dart';

class SingleCoursePage extends StatefulWidget {
  final String courseId;
  final String tabName;

  const SingleCoursePage({
    required this.courseId,
    required this.tabName,
    super.key,
  });

  @override
  State<SingleCoursePage> createState() => _SingleCoursePageState();
}

class _SingleCoursePageState extends State<SingleCoursePage>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    final initialIndex = currentUserTabs.indexOf(widget.tabName);
    super.initState();
    _controller = TabController(
      animationDuration: Duration.zero,
      length: currentUserTabs.length,
      vsync: this,
      initialIndex: initialIndex == -1 ? 0 : initialIndex,
    );
  }

  @override
  void didUpdateWidget(SingleCoursePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = currentUserTabs.indexOf(widget.tabName);
    if (newIndex != -1) {
      _controller.index = newIndex;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: false,
                leading: BackButton(
                  onPressed: () => context.appRouter.pop(),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: BlocBuilder<SingleCourseCubit, SingleCourseState>(
                    builder: (context, courseState) {
                      return courseState.when(
                        initial: () => const Center(child: Text('Starting...')),
                        loadInProgress: () =>
                            const Center(child: CircularProgressIndicator()),
                        loadSuccess: (course) => Text('Курс ${course.title}'),
                        loadFailure: (message) => Center(child: Text(message)),
                      );
                    },
                  ),
                ),
                actions: [
                  _CourseSettingsButton(courseId: widget.courseId),
                  const UserProfileButton(),
                ],
                pinned: true,
                floating: true,
                bottom: TabBar(
                  controller: _controller,
                  onTap: (index) => context.appRouter.goToCoursePageSpecificTab(
                      widget.courseId, currentUserTabs[index]),
                  enableFeedback: false,
                  isScrollable: true,
                  tabs: currentUserTabs
                      .map((tabName) => TabWrapper(child: Text(tabName)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            children: const [
              TabContentWrapper(
                child: LessonsTabView(),
              ),
              TabContentWrapper(
                child: TasksTabView(),
              ),
              TabContentWrapper(
                child: RatingTabView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseSettingsButton extends StatelessWidget {
  final String courseId;
  const _CourseSettingsButton({required this.courseId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.appRouter.goToCourseSettings(courseId),
      icon: const Icon(Icons.edit, color: Colors.black, size: 30),
    );
  }
}
