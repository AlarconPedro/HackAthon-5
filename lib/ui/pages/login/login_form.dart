import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/pages/home_page.dart';
import 'package:hackathon/ui/pages/listar_page.dart';
import 'package:hackathon/ui/pages/login/login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final List<Listar> listar = [];
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 60),
          child: const Text(
            "Login",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              Container(
                height: 150,
                margin: const EdgeInsets.only(
                  right: 70,
                ),
                decoration: Decoracao.sombra(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputText.campoUsuario(usuarioController),
                    InputText.campoSenha(senhaController),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    validaLogin(usuarioController, senhaController);
                  },
                  child: Botoes.botaoLogin(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<String> validaLogin(TextEditingController usuario, senha) async {
    final loginPage = ApiRemote(email: usuario.text, password: senha.text);
    if (usuario != null || senha != null) {
      final response = await loginPage.loginPost();
      // print(loginPage.post());
      if (response.statusCode == 200) {
        // print(response.body);
        Globais.token = response.body;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
      return usuario.text = "Erro";
    }
    return Globais.token;
  }
}
