import 'dart:ui';

import 'package:intl/intl.dart';

abstract class DateFormatters {
  static String courseDateToString(DateTime date, {required Locale locale}) {
    return DateFormat('dd MMMM yyyy', locale.languageCode).format(date);
  }
}
