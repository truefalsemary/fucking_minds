import 'package:flutter/material.dart';
import 'package:lms_front/core/app_router/app_router.dart';
import 'package:lms_front/core/networking/mock.dart';
import 'package:lms_front/features/shared/presentation/user_profile_button.dart';

class CoursePage extends StatefulWidget {
  final String courseId;

  const CoursePage({required this.courseId, super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Курс ...'),
        actions: [
          _SettingsCourseButton(widget: CoursePage(courseId: widget.courseId)),
          const UserProfileButton(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text('Уроки'),
          ),
          SliverList.separated(
            itemCount: Mock.mockLessons.length,
            itemBuilder: (context, index) {
              final lesson = Mock.mockLessons[index];
              return Text(lesson.title);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class _SettingsCourseButton extends StatelessWidget {
  const _SettingsCourseButton({required this.widget});

  final CoursePage widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          context.appRouter.go('/courses/${widget.courseId}/settings'),
      icon: const Icon(Icons.edit, color: Colors.black, size: 30),
    );
  }
}
