import 'package:flutter/material.dart';

enum ListCoursesFilter {
  all,
  active,
  completed;

  static ListCoursesFilter fromString(String? name) => switch (name) {
        'all' => all,
        'active' => active,
        'completed' => completed,
        _ => all,
      };
}

class ListCoursesPage extends StatefulWidget {
  const ListCoursesPage({
    this.filter = ListCoursesFilter.all,
    super.key,
  });

  final ListCoursesFilter filter;

  @override
  State<ListCoursesPage> createState() => _ListCoursesPageState();
}

class _ListCoursesPageState extends State<ListCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Text(widget.filter.toString()),
        ],
      ),
    );
  }
}
