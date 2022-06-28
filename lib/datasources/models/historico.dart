import 'package:hackathon/classes/classes.dart';

class Historico {
  String nome_pessoa;
  String tema_pesquisa;
  String perguntas;
  // int id_pesquisa;
  int id_pessoa;
  String status;

  Historico({
    required this.nome_pessoa,
    required this.tema_pesquisa,
    required this.perguntas,
    required this.status,
    // required this.id_pesquisa,
    required this.id_pessoa,
  });

  factory Historico.fromJson(Map<String, dynamic> mapa) {
    return Historico(
      nome_pessoa: mapa["nome_pessoa"] ?? "",
      tema_pesquisa: mapa["tema_pesquisa"] ?? "",
      // id_pesquisa: mapa["id"].toInt() ?? 0,
      status: mapa["status"].toString(),
      perguntas: mapa["perguntas"].toString(),
      id_pessoa: mapa["id_pessoa"] ?? 0,
    );
  }
}
