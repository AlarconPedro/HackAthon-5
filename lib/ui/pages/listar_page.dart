import 'package:flutter/material.dart';
import 'package:hackathon/datasources/api.dart';
import 'package:hackathon/datasources/models/models.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
import 'package:hackathon/ui/pages/pages.dart';

class ListarPage extends StatefulWidget {
  // final List<Login> listaDados;

  const ListarPage({Key? key}) : super(key: key);

  @override
  State<ListarPage> createState() => _ListarPageState();
}

class _ListarPageState extends State<ListarPage> {
  @override
  Future<void> initState() async {
    final listarDados = ApiRemote();
    final response = await listarDados.listarGet();
    print(response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      // body: Container(
      //   color: Cores.cinza,
      //   child: SizedBox(
      //     child: ListView(
      //       padding: const EdgeInsets.all(8),
      //       children: [
      //         ListView.builder(
      //             padding: const EdgeInsets.all(8),
      //             scrollDirection: Axis.vertical,
      //             itemCount: widget.listaDados.length,
      //             itemBuilder: (context, index) {
      //               return GestureDetector(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(top: 8),
      //                   child: Container(
      //                     padding: const EdgeInsets.all(10),
      //                     decoration: BoxDecoration(
      //                       color: Cores.laranja,
      //                       borderRadius: BorderRadius.circular(10),
      //                     ),
      //                     child: ListTile(
      //                       leading: const Icon(Icons.home),
      //                       title: Text(
      //                         widget.listaDados[index].email,
      //                       ),
      //                       // title: const Text("Home"),
      //                       onTap: () {
      //                         Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                             builder: (context) => const RespostaPage(),
      //                           ),
      //                         );
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // Widget itensList() {
  //   // int qtd_itens = 10;
  //   List<Widget> list = [];
  //   final listarDados = ApiRemote();
  //   final response = listarDados.listarGet();
  //   return ListView.builder(
  //       padding: const EdgeInsets.all(8),
  //       scrollDirection: Axis.vertical,
  //       itemCount: widget.listaDados.length,
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 8),
  //             child: Container(
  //               padding: const EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                 color: Cores.laranja,
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: ListTile(
  //                 leading: const Icon(Icons.home),
  //                 title: Text(
  //                   widget.listaDados[index].email,
  //                 ),
  //                 // title: const Text("Home"),
  //                 onTap: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => const RespostaPage(),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  //   // for (var i = 0; i < widget.listaDados.length; i++) {}
  //   // return Container(
  //   //   child: Column(
  //   //     children: list,
  //   //   ),
  //   // );
  // }
}
