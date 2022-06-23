import 'package:flutter/material.dart';
import 'package:hackathon/ui/decoration/decoration.dart';

class InputText extends StatelessWidget {
  String texto;

  InputText({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          labelText: texto,
          labelStyle: TextStyle(
            color: Cores.azul,
          ),
        ),
      ),
    );
  }
}
