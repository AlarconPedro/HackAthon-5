import 'package:hackathon/classes/classes.dart';

class Login {
  int id;
  String email;
  String senha;

  Login({
    required this.id,
    required this.email,
    required this.senha,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"].toString().toInt(),
        email: json["usuario"].toString(),
        senha: json["email"].toString(),
      );
}
