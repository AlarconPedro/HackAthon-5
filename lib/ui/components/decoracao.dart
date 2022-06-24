import 'package:flutter/material.dart';

class Decoracao {
  static BoxDecoration sombra() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(100),
        bottomRight: Radius.circular(100),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
