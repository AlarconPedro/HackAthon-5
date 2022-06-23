import 'package:flutter/material.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/ui/pages/home_page.dart';
import 'package:hackathon/ui/pages/listar_page.dart';
import 'package:hackathon/ui/pages/login/login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 32),
                      child: TextField(
                        controller: usuarioController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          icon: Icon(Icons.account_circle_rounded),
                          hintText: "Usuário",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 32),
                      child: TextField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 22),
                          border: InputBorder.none,
                          icon: Icon(Icons.vpn_key),
                          hintText: "********",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    validaLogin(usuarioController, senhaController);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[200]!.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1bccba),
                          Color(0xff22e2ab),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.only(right: 16, top: 16),
        //       child: Text(
        //         "Forgot ?",
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.grey[400],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.only(left: 16, top: 24),
        //       child: const Text(
        //         "Register",
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xffe98f60),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }

  Future<String> validaLogin(TextEditingController usuario, senha) async {
    final loginPage = ApiRemote(email: usuario.text, password: senha.text);
    if (usuario != null || senha != null) {
      final response = await loginPage.post();
      // print(loginPage.post());
      if (response.statusCode == 200) {
        final token = response.body;
        print(token);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ListarPage(),
      //   ),
      // );
      return usuario.text = "Erro";
    }
    return "Teste";
  }
}
