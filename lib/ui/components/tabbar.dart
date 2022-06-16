import 'package:flutter/material.dart';
import 'package:hackathon/ui/decoration/cores.dart';

class BarraDeNavegacao {
  static Tab navegacao(IconData icone, String texto) {
    return Tab(
      icon: Icon(icone),
      iconMargin: const EdgeInsets.all(10),
    );
  }
}
