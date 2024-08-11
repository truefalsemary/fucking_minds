import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
import 'package:lms_front/features/main_page/main_page_header.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/components/card/decorated_container.dart';

//Верстка для демо

final courses = [
  Course(
    id: '1',
    title: 'Курс по Flutter',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 10)),
    description:
        'Вы научитесь создавать современные кроссплатформенные приложения с помощью Flutter',
    authorId: '1',
  ),
  Course(
    id: '2',
    title: 'Курс по Машинному обучению',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 10)),
    description:
        'Вы научитесь создавать современные кроссплатформенные приложения с помощью Flutter',
    authorId: '1',
  ),
  Course(
    id: '3',
    title: 'Курс по Математической статистике',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 10)),
    description:
        'Вы научитесь создавать современные кроссплатформенные приложения с помощью Flutter',
    authorId: '1',
  ),
  Course(
    id: '4',
    title: 'Курс по курсам',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 10)),
    description: '',
    authorId: '1',
  ),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: controller,
        thickness: 8,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverPersistentHeader(
              delegate: MainPageHeader(
                expandedHeight: 170,
                collapsedHeight: 60,
              ),
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SideNavigationBar(),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return _CourseTicket(
                            course: course,
                            leading: AppIcons.databaseImg,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: courses.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideNavigationBar extends StatelessWidget {
  const _SideNavigationBar();

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedContainer(
          height: 120,
          width: 200,
          color: const Color(0xff98DCBA),
          child: Text(
            'Все',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
        ),
        const SizedBox(height: 18),
        DecoratedContainer(
          height: 120,
          width: 200,
          color: const Color(0xff86C1F7),
          child: Text(
            'Активные',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
        ),
        const SizedBox(height: 18),
        DecoratedContainer(
          height: 120,
          width: 200,
          color: Colors.black,
          child: Text(
            'Завершенные',
            textAlign: TextAlign.start,
            style: textStyle?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _CourseTicket extends StatelessWidget {
  const _CourseTicket({
    required this.course,
    required this.leading,
  });

  final Course course;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.appRouter.go('/course/${course.id}'),
      child: DecoratedContainer(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading,
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 32),
                      ),
                      if (course.description.isNotEmpty)
                        Text(
                          course.description,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                course.startDate.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
