import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/datasource.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
import 'package:hackathon/ui/pages/pages.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Cores.cinza,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiRemote().listarPesquisasCliente(),
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
              alignment: Alignment.centerLeft,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Cores.azul,
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                iconColor: Cores.preto,
                title: Text(
                  listaDados[index].tema,
                ),
                subtitle: Text(
                  listaDados[index].descricao,
                ),
                trailing: Icon(
                  Icons.check_rounded,
                  textDirection: TextDirection.ltr,
                  color: Cores.branco,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
  // bottomNavigationBar: BarraNavegacao(),
  // body: Container(
  //   color: Cores.cinza,
  //   child: SizedBox(
  //     child: ListView(
  //       padding: const EdgeInsets.all(10),
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             color: Cores.verde,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: ListTile(
  //             leading: const Icon(Icons.home),
  //             title: const Text("Home"),
  //             onTap: () {
  //               Globais.tabSelected = 0;
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // ),
