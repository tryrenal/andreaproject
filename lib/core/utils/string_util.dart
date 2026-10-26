import 'package:intl/intl.dart';

class StringUtil {
  static String doubleToStringDollarCurrency(double input) {
    final formatter = NumberFormat.simpleCurrency(locale: 'en_US', name: 'USD');
    return formatter.format(input);
  }
}
