import 'package:intl/intl.dart';

class TFormatter {
  static String formatData(DateTime? date) {
    final DateTime x = date ?? DateTime.now();
    return DateFormat('dd-MMM-YYYY').format(x);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_RS', symbol: '₹').format(amount);
  }

  static String formatPhoneNumber(String phonenumber) {
    if (phonenumber.length == 13 && phonenumber.startsWith("+91")) {
      return phonenumber;
    }
    throw ArgumentError("Invalid number");
  }
}
