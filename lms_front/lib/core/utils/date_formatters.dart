import 'package:intl/intl.dart';

abstract class DateFormatters {
  static String courseDateToString(DateTime date) {
    return DateFormat('dd MM yyyy').format(date);
  }
}
