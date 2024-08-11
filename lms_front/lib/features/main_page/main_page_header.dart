import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';

class MainPageHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  MainPageHeader({
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final collapsePercent = shrinkOffset / expandedHeight;
    final currentHeight =
        (1 - collapsePercent) * (expandedHeight - minExtent) + minExtent;
    final shadowPercent =
        (collapsePercent >= 0.7) ? (collapsePercent - 0.7) / 0.3 : 0.0;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: currentHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shadowPercent > 0
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5 * shadowPercent,
                  spreadRadius: 5 * shadowPercent,
                ),
              ]
            : [],
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: lerpDouble(20, 70, collapsePercent)!,
                top: 10,
                bottom: 10,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text(
                      'КУРСЫ',
                      style: textTheme.titleLarge?.copyWith(
                        fontSize: lerpDouble(32, 20, collapsePercent),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: ColorPalette.black,
                              ),
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
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: lerpDouble(20, 10, collapsePercent)!,
                  horizontal: lerpDouble(20, 10, collapsePercent)!,
                ),
                child: SvgPicture.asset('assets/icons/account_circle.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
