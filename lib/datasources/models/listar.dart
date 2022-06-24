class Listar {
  String nome;
  String email;

  Listar({required this.nome, required this.email});

  factory Listar.fromJson(Map<String, dynamic> json) {
    return Listar(
      nome: json["nome"].toString(),
      email: json["email"].toString(),
    );
  }
}
