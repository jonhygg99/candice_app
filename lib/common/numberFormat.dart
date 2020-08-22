import 'package:intl/intl.dart';

String numberFormat(dynamic nb) {
  return NumberFormat.compact().format(nb);
}
