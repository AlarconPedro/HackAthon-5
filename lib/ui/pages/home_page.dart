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
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 250,
    ),
    Icon(
      Icons.list_outlined,
      size: 250,
    ),
    Icon(
      Icons.history_outlined,
      size: 250,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Listar> listar = [];
  final BarraNavegacao barraNavegacao = BarraNavegacao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Cores.laranja,
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(2, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Cores.branco,
          iconSize: 35,
          selectedItemColor: Cores.laranja,
          unselectedItemColor: Cores.preto,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: 'Listar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: 'Histórico',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      body: _selectedIndex == 0
          ? _telaHome()
          : _selectedIndex == 1
              ? ListarPage(listar)
              : _selectedIndex == 2
                  ? const HistoricoPage()
                  : Container(),
    );
  }

  static int selecionaTela(int index) {
    index = Globais.tabSelected;
    return index;
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
