import 'package:flutter/material.dart';

class TabWrapper extends StatelessWidget {
  const TabWrapper({
    required this.child,
    super.key,
    EdgeInsets? tabPadding,
  }) : padding = tabPadding ??
            const EdgeInsets.symmetric(
              horizontal: 70,
              vertical: 12,
            );

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
