import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';

class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    required this.child,
    this.height,
    this.width,
    this.color,
    this.padding = const EdgeInsets.all(20),
    super.key,
  });

  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? padding;

  static const _borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: _border,
      ),
      child: child,
    );
  }

  Border? get _border =>
      color == null ? Border.all(color: ColorPalette.black) : null;
}
