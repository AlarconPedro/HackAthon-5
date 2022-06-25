import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/components/textos.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  final barraNavegacao = BarraNavegacao;

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Listar> listar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      bottomNavigationBar: BarraNavegacao(),
      body: selectTab(
        Globais.tabSelected,
      ),
    );
  }

  Widget selectTab(int index) {
    setState(() {
      Globais.tabSelected = index;
    });
    switch (index) {
      case 0:
        setState(() {});
        return _telaHome();
      case 1:
        setState(() {});
        return ListarPage(listar);
      case 2:
        setState(() {});
        return HistoricoPage();
      default:
        return Container();
    }
  }

  Widget _telaHome() {
    setState(() {});
    return Container(
      color: Cores.cinza,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Cores.cinza,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ImagemFundo.fundo(
                            sImagem: "images/logo.png",
                            h: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
