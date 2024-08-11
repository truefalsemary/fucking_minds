import 'package:flutter/material.dart';

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
        title: const Text('Course'),
      ),
    );
  }
}
