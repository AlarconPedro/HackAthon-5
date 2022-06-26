import 'package:hackathon/classes/classes.dart';

class Listar {
  String tema;
  String descricao;
  String perguntas;
  int id;
  String status;

  Listar({
    required this.tema,
    required this.descricao,
    required this.id,
    required this.perguntas,
    required this.status,
  });

  factory Listar.fromJson(Map<String, dynamic> mapa) {
    return Listar(
      tema: mapa["tema"] ?? "",
      descricao: mapa["descricao"] ?? "",
      id: mapa["id"].toInt() ?? 0,
      status: mapa["status"].toString(),
      perguntas: mapa["perguntas"].toString(),
    );
  }
}
