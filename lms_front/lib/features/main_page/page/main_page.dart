import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/main_page/course_list/course_list.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_bar.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/features/shared/presentation/user_profile_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UserProfileButton(),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'КУРСЫ',
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          onChanged: (value) => context
                              .read<CourseListSortCubit>()
                              .updateSearchQuery(value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // Префиксная иконка с текстом
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Поиск',
                            hintStyle: textTheme.titleSmall,
                          ),
                          style:
                              textTheme.titleSmall, // Цвет текста внутри поля
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            CourseListSortBar(),
            SizedBox(width: 20),
            CourseList(),
          ],
        ),
      ),
    );
  }
}
