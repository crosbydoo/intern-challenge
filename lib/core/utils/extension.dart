import 'package:intl/intl.dart';

extension DateConversion on DateTime {
  String convertDate() {
    final dateTime = DateTime.parse(toString());
    final formattedDate = DateFormat.yMMMM().format(dateTime);
    return formattedDate;
  }
}

extension CamelCaseExtension on String {
  String toCamelCase() {
    if (isEmpty) {
      return '';
    }

    final words = split(RegExp(r'\s+'));
    final result = words.map((word) {
      return word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '';
    }).join();

    return result;
  }
}
