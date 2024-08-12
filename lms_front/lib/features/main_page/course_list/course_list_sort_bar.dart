import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_category.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/ui_kit/components/card/decorated_container.dart';

class CourseListSortBar extends StatelessWidget {
  const CourseListSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: [
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverList.separated(
            itemCount: CourseListSortCategory.categories.length,
            itemBuilder: (context, index) {
              final sortCategory = CourseListSortCategory.categories[index];
              return BlocBuilder<CourseListSortCubit, CourseListSortState>(
                builder: (context, sortState) {
                  return Opacity(
                    opacity:
                        sortState.selectedCategory == sortCategory ? 0.5 : 1,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => context
                          .read<CourseListSortCubit>()
                          .updateCategory(sortCategory),
                      child: Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1.4,
                              child: DecoratedContainer(
                                color: Color(sortCategory.tileColorInt),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _numberWithMaybeLeadingZero(index + 1),
                                      style: textStyle!.copyWith(
                                        color: Color(sortCategory.textColorInt),
                                      ),
                                    ),
                                    Text(
                                      sortCategory.displayName,
                                      textAlign: TextAlign.start,
                                      style: textStyle.copyWith(
                                        color: Color(sortCategory.textColorInt),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }

  String _numberWithMaybeLeadingZero(int number) {
    if (number >= 1 && number <= 9) {
      return '0$number';
    }
    return number.toString();
  }
}
