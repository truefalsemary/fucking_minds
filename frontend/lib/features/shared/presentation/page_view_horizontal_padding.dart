import 'package:flutter/material.dart';

class PageViewHorizontalPadding extends StatelessWidget {
  final Widget child;
  const PageViewHorizontalPadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: child,
    );
  }
}
