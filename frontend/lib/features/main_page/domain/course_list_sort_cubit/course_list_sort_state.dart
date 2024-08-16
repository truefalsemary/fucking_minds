part of 'course_list_sort_cubit.dart';

class CourseListSortState {
  final CourseListSortCategory selectedCategory;
  final String searchQuery;

  CourseListSortState({
    required this.selectedCategory,
    required this.searchQuery,
  });

  CourseListSortState copyWith({
    CourseListSortCategory? selectedCategory,
    String? searchQuery,
  }) {
    return CourseListSortState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
