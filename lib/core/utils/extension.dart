import 'package:intl/intl.dart';

extension DateConversion on DateTime {
  String convertDate() {
    final dateTime = DateTime.parse(toString());
    final formattedDate = DateFormat.yMMMM().format(dateTime);
    return formattedDate;
  }
}
