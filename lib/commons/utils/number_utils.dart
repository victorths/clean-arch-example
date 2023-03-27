extension NumberFormat on double {
  String get formatNumber => 'R\$${toStringAsFixed(2).replaceAll('.', ',')}';

  String get formatNumberWithSpacing =>
      'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
}
