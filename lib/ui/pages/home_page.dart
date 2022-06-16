import 'package:flutter/material.dart';
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/components/textos.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _iTabSelecionada = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_tabControllerSelection);
  }

  List<Tab> myTabs = <Tab>[
    BarraDeNavegacao.navegacao(Icons.home, 'Início'),
    BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
    BarraDeNavegacao.navegacao(Icons.access_alarm_rounded, 'Perfil'),
    BarraDeNavegacao.navegacao(Icons.ac_unit, 'Mensagens'),
  ];

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_iTabSelecionada == 0) _telaHome(),
            if (_iTabSelecionada == 1) _telaBuscar(),
            if (_iTabSelecionada == 2) _telaPerfil(),
            if (_iTabSelecionada == 3) _telaMensagens(),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Cores.laranja,
                    // borderRadius: ,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7.0,
                        spreadRadius: 7.0,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Cores.laranja,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      10.0,
                      10.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: TabBar(
                  controller: _tabController,
                  tabs: myTabs,
                  indicatorColor: Cores.preto,
                  unselectedLabelColor: Cores.preto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _telaHome() {
    setState(() {});
    return Expanded(
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
                      "images/logo.png",
                      h: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _telaBuscar() {
    setState(() {});
    return Expanded(
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
                      "images/facebook_icon_hover.png",
                      h: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _telaPerfil() {
    setState(() {});
    return Expanded(
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
                      "images/icone_website_hover.png",
                      h: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _telaMensagens() {
    setState(() {});
    return Expanded(
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
                      "images/instagram_icon_hover.png",
                      h: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tabControllerSelection() {
    if (_tabController.indexIsChanging) {
      if (_tabController.index == 0) {
        _iTabSelecionada = _tabController.index;
        setState(() {
          myTabs = <Tab>[
            BarraDeNavegacao.navegacao(Icons.home, 'Início'),
            BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
            BarraDeNavegacao.navegacao(Icons.access_alarm_rounded, 'Perfil'),
            BarraDeNavegacao.navegacao(Icons.ac_unit, 'Mensagens'),
          ];
        });
      }
      if (_tabController.index == 1) {
        _iTabSelecionada = _tabController.index;
        setState(() {
          myTabs = <Tab>[
            BarraDeNavegacao.navegacao(Icons.home, 'Início'),
            BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
            BarraDeNavegacao.navegacao(Icons.access_alarm_rounded, 'Perfil'),
            BarraDeNavegacao.navegacao(Icons.ac_unit, 'Mensagens'),
          ];
        });
      }
      if (_tabController.index == 2) {
        _iTabSelecionada = _tabController.index;
        setState(() {
          myTabs = <Tab>[
            BarraDeNavegacao.navegacao(Icons.home, 'Início'),
            BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
            BarraDeNavegacao.navegacao(Icons.access_alarm_rounded, 'Perfil'),
            BarraDeNavegacao.navegacao(Icons.ac_unit, 'Mensagens'),
          ];
        });
      }
      if (_tabController.index == 3) {
        _iTabSelecionada = _tabController.index;
        setState(() {
          myTabs = <Tab>[
            BarraDeNavegacao.navegacao(Icons.home, 'Início'),
            BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
            BarraDeNavegacao.navegacao(Icons.access_alarm_rounded, 'Perfil'),
            BarraDeNavegacao.navegacao(Icons.ac_unit, 'Mensagens'),
          ];
        });
      }
    }
  }
}
