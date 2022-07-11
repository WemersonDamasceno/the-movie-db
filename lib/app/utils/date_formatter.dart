import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(dateTime);
  }
}
