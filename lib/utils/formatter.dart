import 'package:intl/intl.dart';

String formatRupiah(double amount) {
  // Use NumberFormat class to format the currency
  final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  // Format the amount to currency
  return formatCurrency.format(amount);
}
