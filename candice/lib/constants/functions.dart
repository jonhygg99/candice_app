import 'package:intl/intl.dart';

String numberFormat(int nb) {
  return NumberFormat.compact().format(nb);
}
