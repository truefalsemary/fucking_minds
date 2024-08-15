import 'package:flutter/material.dart';

class TabContentWrapper extends StatelessWidget {
  const TabContentWrapper({
    required this.child,
    super.key,
    EdgeInsets? tabPadding,
  }) : padding = tabPadding ?? const EdgeInsets.only(bottom: 40);

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            border: Border.all(),
          ),
          child: child,
        ));
  }
}
