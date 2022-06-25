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

class ListarPage extends StatelessWidget {
  final List<Listar> listar;

  ListarPage(this.listar, {Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiRemote().get(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const CirculoEspera();
                  default:
                    if (snapshot.hasError) {
                      return Text(
                          "Erro ao exigir a listagem (${snapshot.error.toString()})");
                    } else {
                      return listarPesquisas(snapshot.data as List<Listar>);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listarPesquisas(List<Listar> listaDados) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      itemCount: listaDados.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Cores.laranja,
              ),
              child: ListTile(
                iconColor: Cores.preto,
                title: Text(
                  listaDados[index].descricao,
                ),
                subtitle: Text(
                  listaDados[index].tema,
                ),
              ),
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
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
