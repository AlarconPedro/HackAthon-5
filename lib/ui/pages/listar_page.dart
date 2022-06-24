import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/models.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ListarPage extends StatefulWidget {
  const ListarPage({Key? key}) : super(key: key);

  @override
  State<ListarPage> createState() => _ListarPageState();
}

class _ListarPageState extends State<ListarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      body: Container(
        color: Cores.cinza,
        child: SizedBox(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listarJson().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Cores.laranja,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.home),
                          title: Text(
                            listarJson()[index].nome,
                          ),
                          // title: const Text("Home"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RespostaPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> listarJson() {
    String token = Globais.token;
    Map<String, dynamic> mapa = JwtDecoder.decode(token);
    return fromJson(mapa);
    // return mapa = listaDados.map((e) => fromJson(e)) as Map<String, dynamic>;
  }

  // Map<String, dynamic> listarFromJson() {
  //   List<Login> lista = [];
  //   String token = Globais.token;
  //   return lista = JwtDecoder.decode(token);
  // }

  fromJson(Map<String, dynamic> mapa) {
    List<Login> lista = [];
    for (var i = 0; i < mapa.length; i++) {
      lista.add(fromJson(mapa[i]));
    }
    // mapa.forEach((key, value) {
    //   lista.add(Login.fromJson(value));
    // });
    return lista;
    // return lista.add(
    //   id: mapa["id"].toString().toInt(),
    //   email: mapa["email"].toString(),
    //   senha: mapa["senha"].toString(),
    // );
  }

  Widget itensList() {
    Map<String, dynamic> list = listarJson();
    // int qtd_itens = 10;
    final listarDados = ApiRemote();
    final response = listarDados.listarGet();
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Cores.laranja,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    list[index].email,
                  ),
                  // title: const Text("Home"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RespostaPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
