extension StringExtension on String {
  int toInt({valorPadrao = 0}) {
    return int.tryParse(this) ?? valorPadrao;
  }

  double toDouble({valorPadrao = 0.0}) {
    return double.tryParse(this) ?? valorPadrao;
  }
}
