import 'package:flutter/material.dart';

class BarraDeNavegacao {
  static Tab navegacao(IconData icone, String texto) {
    return Tab(
      icon: Icon(icone),
      iconMargin: const EdgeInsets.all(12),
    );
  }
}
