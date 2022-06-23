import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Textos.textoAppBar(),
        centerTitle: true,
        backgroundColor: Cores.laranja,
      ),
      bottomNavigationBar: BarraNavegacao(),
      body: Container(
        color: Cores.cinza,
        child: SizedBox(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Cores.verde,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
