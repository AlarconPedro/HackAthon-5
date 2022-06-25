import 'package:hackathon/classes/classes.dart';

class Listar {
  String tema;
  String descricao;
  // String id;

  Listar({
    required this.tema,
    required this.descricao,
    // required this.id,
  });

  factory Listar.fromJson(Map<String, dynamic> mapa) {
    return Listar(
      tema: mapa["tema"] ?? "",
      descricao: mapa["descricao"] ?? "",
      // id: mapa["id"].toInt(),
      // perguntas: mapa["descricao"].toString(),
    );
  }
}
