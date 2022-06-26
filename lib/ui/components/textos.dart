import 'package:flutter/material.dart';
import 'package:hackathon/ui/components/components.dart';
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

  static Card detalhesText() {
    final TextEditingController controller;
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "1° Pergunta",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Cores.laranja,
              ),
              child: ListTile(
                iconColor: Cores.preto,
                title: Text(
                  "listaDados[index].descricao, listaDados[index].tema, ",
                ),
                subtitle: Text(
                  "listaDados[index].tema",
                ),
                // trailing: Icon(
                //   Icons.send_rounded,
                //   textDirection: TextDirection.ltr,
                //   color: Cores.preto,
                // ),
              ),
            ),
          ),
          InputText.respostaPesquisa(),
        ],
      ),
      shadowColor: Cores.laranja,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
