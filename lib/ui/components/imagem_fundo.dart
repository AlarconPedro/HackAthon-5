import 'package:hackathon/ui/components/components.dart';
import 'package:flutter/material.dart';

class ImagemFundo {
  static Widget fundo(String sImagem,
      {boxFit = BoxFit.fill, double? w, double? h}) {
    return Image(
      image: AssetImage(sImagem),
      fit: boxFit,
      height: h,
      width: w,
    );
  }

  static Decoration criar({sImagem = "images/logo.png"}) {
    return BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        image: AssetImage(sImagem),
      ),
    );
  }
}
