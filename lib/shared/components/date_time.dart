import 'package:intl/intl.dart';

class DateTimeFormat {
  static String formatTaskDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }
}