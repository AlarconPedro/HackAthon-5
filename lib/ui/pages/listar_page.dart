import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/datasources/models/models.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ListarPage extends StatefulWidget {
  final List<Listar> listar;

  const ListarPage({required this.listar, Key? key}) : super(key: key);

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
              listarDados(),

              // FutureBuilder(
              //     future: ApiRemote().listarDadosWeb(),
              //     builder: (context, snapshot) {
              //       switch (snapshot.connectionState) {
              //         case ConnectionState.waiting:
              //         case ConnectionState.active:
              //           return listarDados();
              //         case ConnectionState.none:
              //           return const CirculoEspera();
              //         default:
              //           return listarDados();
              //         // if (snapshot.hasData) {
              //         //   return listarDados();
              //         // }
              //         // if (snapshot.hasError) {
              //         //   return Text(
              //         //       "Erro ao exigir a listagem (${snapshot.error.toString()})");
              //         // } else {
              //         //   return listarDados();
              //         // }
              //       }
              //     }),
            ],
          ),
        ),
      ),
    );
  }

  Widget listarDados() {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Cores.laranja,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                iconColor: Cores.preto,
                title: Text("widget.listar[index].nome"),
                subtitle: Text("widget.listar[index].email"),
                trailing: IconButton(
                  icon: Icon(Icons.drive_file_rename_outline_sharp),
                  onPressed: () {
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
    );
  }

  Widget listarDados_old() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.listar.length,
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
                  widget.listar[index].nome,
                  // listarDadosWeb().toString(),
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
    );
  }

  // Future<Map<String, dynamic>> listarDadosWeb() async {
  //   final content = ApiRemote(token: Globais.token);
  //   final response = await content.listarGet();
  //   final Map<String, dynamic> mapa = JwtDecoder.decode(response.body);
  //   print(mapa);
  //   return mapa;
  // }

  // Future<List> fromToken(Map<String, dynamic> mapa) async {
  //   final mapaToken = await listarDados();
  //   for (var i; i < mapa.length; i++) {
  //     mapaToken.map((key, value) => null);
  //   }
  // }
  // String token = Globais.token;
  // Map<String, dynamic> mapa = JwtDecoder.decode(token);
  // return toJson(mapa);

  // return mapa = listaDados.map((e) => fromJson(e)) as Map<String, dynamic>;
}

Future<List<Listar>> listarDadosWeb() async {
  final listPage = ApiRemote(token: Globais.token);
  final response = await listPage.listarDadosWeb();
  print(response);
  if (response.statusCode == 200) {
    List itensList = jsonDecode(response.body);
    print('passou aqui');
    List<Listar> listar = [];
    for (var itensMap in itensList) {
      listar.add(Listar.fromJson(itensMap));
    }

    return listar;
  } else {
    throw Exception('Failed to load themes');
  }
}
