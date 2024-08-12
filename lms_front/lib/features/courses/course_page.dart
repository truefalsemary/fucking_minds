import 'package:flutter/material.dart';
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
        actions: const [
          UserProfileButton(),
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
