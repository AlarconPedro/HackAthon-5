import 'package:hackathon/classes/classes.dart';

class Listar {
  String tema;
  String descricao;
  String perguntas;
  int id_pesquisa;
  int id_pessoa;
  String status;

  Listar({
    required this.tema,
    required this.descricao,
    required this.perguntas,
    required this.status,
    required this.id_pesquisa,
    required this.id_pessoa,
  });

  factory Listar.fromJson(Map<String, dynamic> mapa) {
    return Listar(
      tema: mapa["tema"] ?? "",
      descricao: mapa["descricao"] ?? "",
      id_pesquisa: mapa["id"].toInt() ?? 0,
      status: mapa["status"].toString(),
      perguntas: mapa["perguntas"].toString(),
      id_pessoa: mapa["id_pessoa"] ?? 0,
    );
  }

  void add(Listar listar) {}
}
