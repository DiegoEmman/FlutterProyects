import 'package:intl/intl.dart';

class HumanFormats {

  static String formatNumber(double number) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
  }

}