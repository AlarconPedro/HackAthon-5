import 'package:flutter/material.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class InputText {
  static Widget campoUsuario(TextEditingController usuarioController) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 32),
      child: TextField(
        controller: usuarioController,
        decoration: const InputDecoration(
          hintStyle: TextStyle(fontSize: 20),
          border: InputBorder.none,
          icon: Icon(Icons.account_circle_rounded),
          hintText: "Usuário",
        ),
      ),
    );
  }

  static Widget campoSenha(TextEditingController senhaController) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 32),
      child: TextField(
        controller: senhaController,
        obscureText: true,
        decoration: const InputDecoration(
          hintStyle: TextStyle(fontSize: 22),
          border: InputBorder.none,
          icon: Icon(Icons.vpn_key),
          hintText: "********",
        ),
      ),
    );
  }
}
