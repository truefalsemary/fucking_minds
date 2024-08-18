import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/features/courses/single_course/presentation/tab_views/lessons_tab_view.dart';

class LessonsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/course/:courseId/lessons',
        '/course/:courseId/lessons/:lessonId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final lessonId = state.pathParameters['lessonId'];

    if (lessonId != null) {
      return [
        BeamPage(
          key: ValueKey('LessonDetail-$lessonId'),
          title: 'Lesson $lessonId',
          type: BeamPageType.slideTransition,
          child: LessonDetailPage(lessonId: lessonId),
        ),
      ];
    }

    return [
      const BeamPage(
        key: ValueKey('LessonsList'),
        title: 'Lessons',
        child: LessonsTabView(),
      ),
    ];
  }
}

class LessonDetailPage extends StatelessWidget {
  final String lessonId;
  const LessonDetailPage({required this.lessonId, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: Beamer.of(context).beamBack,
          ),
          title: Text('Lesson $lessonId'),
        ),
        body: Hero(
          tag: 'lesson_$lessonId',
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('data'),
          ),
        ),
      ),
    );
  }
}
