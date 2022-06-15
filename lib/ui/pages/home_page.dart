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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  List<Tab> myTabs = <Tab>[
    BarraDeNavegacao.navegacao(Icons.home, 'Início'),
    BarraDeNavegacao.navegacao(Icons.search, 'Buscar'),
    BarraDeNavegacao.navegacao(const IconData(0xF4C1), 'Perfil'),
    BarraDeNavegacao.navegacao(const IconData(0xF4C2), 'Mensagens'),
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
        decoration: BoxDecoration(
          color: Cores.preto,
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: TabBar(
            controller: _tabController,
            tabs: myTabs,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.transparent,
          ),
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
                children: const [
                  Center(
                      // child: ImagemFundo.fundo(
                      //   "images/logo.png",
                      //   h: 300,
                      // ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
