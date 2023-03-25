extension NumberFormat on double {
  String get formatNumber => 'R\$${toStringAsFixed(2).replaceAll('.', ',')}';
}
