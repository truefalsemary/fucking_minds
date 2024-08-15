import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_category.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'course_list_sort_state.dart';

class CourseListSortCubit extends Cubit<CourseListSortState> {
  CourseListSortCubit()
      : super(CourseListSortState(
          selectedCategory: CourseListSortCategory.categories.first,
          searchQuery: '',
        ));

  void updateCategory(CourseListSortCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  List<Course> applySortAndFilter(List<Course> courses) {
    var sortedCourses = state.selectedCategory.fn(courses);
    if (state.searchQuery.isNotEmpty) {
      sortedCourses = sortedCourses
          .where((course) =>
              course.title
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase()) ||
              course.description
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase()))
          .toList();
    }
    return sortedCourses;
  }
}
