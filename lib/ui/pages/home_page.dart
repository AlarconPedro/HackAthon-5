import 'package:flutter/material.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/components/textos.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  final BarraNavegacao? barraNavegacao;

  const HomePage({Key? key, this.barraNavegacao}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController _tabController;
  int _iTabSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      bottomNavigationBar: BarraNavegacao(),
      body: widget.barraNavegacao == 0
          ? Container(
              color: Cores.cinza,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _telaHome(),
                ],
              ),
            )
          : Container(
              child: _iTabSelecionada == 0
                  ? _telaHome()
                  : _iTabSelecionada == 1
                      ? ListarPage()
                      // ? ListarPage()
                      : _iTabSelecionada == 2
                          ? const HistoricoPage()
                          : const RespostaPage(),
            ),
    );
  }

  Widget _telaHome() {
    return Container(
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
