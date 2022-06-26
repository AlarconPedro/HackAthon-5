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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.text,
      ),
    );
  }

  static Widget respostaPerguntas() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 16, right: 32),
        child: const TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            icon: Icon(Icons.abc_rounded),
            hintText: "Digite sua resposta",
          ),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }

  static Widget respostaPesquisa() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 16, right: 32),
        child: const TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            icon: Icon(Icons.search_rounded),
            hintText: "Digite sua pesquisa",
          ),
          autofocus: false,
          maxLines: null,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
