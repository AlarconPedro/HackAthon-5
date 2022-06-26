import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class RespostaPage extends StatefulWidget {
  final Listar listar;
  const RespostaPage(this.listar, {Key? key}) : super(key: key);

  @override
  State<RespostaPage> createState() => _RespostaPageState();
}

class _RespostaPageState extends State<RespostaPage> {
  String p1 = "";
  String p2 = "";
  String p3 = "";
  List<String> listaPerguntas = [];
  @override
  Widget build(BuildContext context) {
    String teste = widget.listar.perguntas;
    final splited = teste.split("|");
    for (var j = 0; j < widget.listar.perguntas.length; j++) {
      for (var i = 0; i < splited.length; i++) {
        if (i == j) {
          listaPerguntas.add(splited[i]);
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      body: Container(
        color: Cores.cinza,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            pergunta1(),
            pergunta2(),
            pergunta3(),
          ],
        ),
      ),
    );
  }

  Widget pergunta3() {
    return Container(
      color: Cores.cinza,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "3° Pergunta",
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
                  title: Text(widget.listar.tema),
                  subtitle: Text(
                    listaPerguntas[2],
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
      ),
    );
  }

  Widget pergunta2() {
    return Container(
      color: Cores.cinza,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "2° Pergunta",
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
                    widget.listar.tema,
                  ),
                  subtitle: Text(
                    listaPerguntas[1],
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
      ),
    );
  }

  Widget pergunta1() {
    return Container(
      color: Cores.cinza,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    listaPerguntas[0],
                  ),
                  subtitle: Text(
                    widget.listar.tema,
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
      ),
    );
  }
}
