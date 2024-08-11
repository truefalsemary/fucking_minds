import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIcons {
  static final SvgPicture editPencil = SvgPicture.asset(
    'assets/icons/pencil-to-line.svg',
  );

  static final SvgPicture calendar = SvgPicture.asset(
    'assets/icons/calendar.svg',
    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    height: 16,
    width: 16,
  );

  static final SvgPicture databaseImg = SvgPicture.asset(
    'assets/images/database.svg',
    width: 50,
    height: 50,
  );

  static final SvgPicture projectImg = SvgPicture.asset(
    'assets/images/project.svg',
    width: 50,
    height: 50,
  );

  static final SvgPicture snapshotImg = SvgPicture.asset(
    'assets/images/snapshot.svg',
    width: 50,
    height: 50,
  );
}
