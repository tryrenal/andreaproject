import 'package:intl/intl.dart';

String formatedDateBydMMMyyyy(DateTime dateTime) {
  return DateFormat('d MMM, yyyy').format(dateTime);
}
