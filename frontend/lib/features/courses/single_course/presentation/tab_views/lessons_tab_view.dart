import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/data/repository_impl/lesson_repository_impl.dart';
import 'package:lms_front/features/shared/domain/lesson/lesson_list_bloc/lesson_list_bloc.dart';
import 'package:lms_front/features/shared/domain/lesson/lesson_list_bloc/lesson_list_event.dart';
import 'package:lms_front/features/shared/domain/lesson/lesson_list_bloc/lesson_list_state.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LessonListBloc(
          lessonRepository: context.read<LessonRepositoryImpl>(),
        )..add(const LessonListFetched());
      },
      child: BlocBuilder<LessonListBloc, LessonListState>(
        builder: (context, lessonListState) {
          return lessonListState.when(
            initial: () => const Center(child: Text('Starting...')),
            loadInProgress: () =>
                const Center(child: CircularProgressIndicator()),
            loadSuccess: (lessons) => LessonsListView(lessons: lessons),
            loadFailure: (message) => Center(child: Text(message.toString())),
            operationFailure: (error) => Text(error.toString()),
          );
        },
      ),
    );
  }
}

class LessonsListView extends StatelessWidget {
  final List<Lesson> lessons;

  const LessonsListView({required this.lessons, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 50),
            shrinkWrap: true,
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return _LessonTile(lesson: lesson);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({
    required this.lesson,
  });

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Beamer.of(context)
          .beamToNamed('/course/course_1/lessons/${lesson.id}'),
      child: Hero(
        tag: 'lesson_${lesson.id}',
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.title,
                style: context.appTextTheme.header1,
              ),
              Text(
                lesson.description,
                style: context.appTextTheme.body3,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Автор: ${lesson.authorId}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
