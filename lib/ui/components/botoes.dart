import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botoes {
  static Widget botaoLogin() {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.green[200]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff1bccba),
            Color(0xff22e2ab),
          ],
        ),
      ),
      child: const Icon(
        Icons.arrow_forward_outlined,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
