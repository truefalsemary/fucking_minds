import 'package:flutter/material.dart';

class TabContentWrapper extends StatefulWidget {
  const TabContentWrapper({
    required this.child,
    super.key,
    EdgeInsets? tabPadding,
  }) : padding = tabPadding ?? const EdgeInsets.only(bottom: 40);

  final Widget child;
  final EdgeInsets padding;

  @override
  State<TabContentWrapper> createState() => _TabContentWrapperState();
}

class _TabContentWrapperState extends State<TabContentWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
        padding: widget.padding,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            border: Border.all(),
          ),
          child: widget.child,
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
