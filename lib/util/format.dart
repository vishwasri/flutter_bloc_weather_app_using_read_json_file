import 'package:intl/intl.dart';

class MyFormat {
  static String formatToCurrency(double number) {
    NumberFormat formatter = new NumberFormat("#,###");
    return formatter.format(number);
  }

  static String formatToCurrencyDecimal(double number) {
    NumberFormat formatter = new NumberFormat.currency(symbol: '');
    return formatter.format(number);
  }

  static String getFormattedCurrentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
