import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
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
      if (response.statusCode == 200) {
        Globais.token = response.body;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        usuario.text = "";
        senha.text = "";
        showDialog(
            context: context, builder: (BuildContext context) => alerta());
      }
    }
    return Globais.token;
  }

  AlertDialog alerta() {
    return AlertDialog(
      title: const Text("Usuário ou senha inválido !"),
      content: const Text("Por favor digite um usuário e senha válidos."),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Cores.laranja,
            shadowColor: Cores.laranja,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
