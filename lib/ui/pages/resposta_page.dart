import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class RespostaPage extends StatefulWidget {
  final Listar listar;
  const RespostaPage(
    this.listar, {
    Key? key,
  }) : super(key: key);

  @override
  State<RespostaPage> createState() => _RespostaPageState();
}

class _RespostaPageState extends State<RespostaPage> {
  String p1 = "";
  String p2 = "";
  String p3 = "";
  List<String> listaPerguntas = [];

  final TextEditingController controllerResposta1 = TextEditingController();
  final TextEditingController controllerResposta2 = TextEditingController();
  final TextEditingController controllerResposta3 = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Cores.laranja,
                      shadowColor: Cores.laranja,
                      fixedSize: const Size(150, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      resposta();
                    },
                    child: const Text(
                      "Enviar Resposta",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> resposta() async {
    final enviarResposta = ApiRemote();
    final response = await enviarResposta.enviaResposta(controllerResposta1,
        controllerResposta2, controllerResposta3, widget.listar.id_pesquisa);
    if (response.statusCode == 200) {
      print("foiiii");
      Navigator.of(context).pop();
      return response.body;
    } else {
      return response.body;
    }
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
                  title: Text(
                    listaPerguntas[2],
                  ),
                ),
              ),
            ),
            InputText.respostaPesquisa(controllerResposta3),
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
                    listaPerguntas[1],
                  ),
                ),
              ),
            ),
            InputText.respostaPesquisa(controllerResposta2),
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
                ),
              ),
            ),
            InputText.respostaPesquisa(controllerResposta1),
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
