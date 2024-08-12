import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/features/main_page/course_list/course_tile.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_bloc.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_state.dart';
import 'package:lms_front/ui_kit/app_icons.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: BlocBuilder<CourseListBloc, CourseListState>(
        builder: (context, courseList) {
          switch (courseList) {
            case CourseListInitial _:
            case CourseListLoadInProgress _:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case final CourseListLoadSuccess successState:
              return CustomScrollView(
                slivers: [
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  BlocBuilder<CourseListSortCubit, CourseListSortState>(
                    builder: (context, sortState) {
                      final sortedList = context
                          .read<CourseListSortCubit>()
                          .applySortAndFilter(successState.courses);
                      return SliverList.separated(
                        itemBuilder: (context, index) {
                          final course = sortedList[index];
                          return CourseTile(
                            course: course,
                            leading: AppIcons.databaseImg,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: sortedList.length,
                      );
                    },
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                ],
              );
            case final CourseListLoadFailure state:
              return Text(state.error.toString());
            case CourseOperationFailure _:
              return Text(courseList.error.toString());
          }
        },
      ),
    );
  }
}
