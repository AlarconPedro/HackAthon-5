import 'package:flutter/material.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class Textos {
  static Text textoAppBar() {
    return Text(
      'Angler',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Cores.preto,
      ),
    );
  }

  static Text textoLogin() {
    return const Text(
      "Login",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
