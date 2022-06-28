import 'package:flutter/material.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:hackathon/ui/pages/pages.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Globais {
  static String linkGetLogin = "http://187.87.223.235:8000/api/login";
  static String linkGetListarJWT = "http://187.87.223.235:8000/api/pesquisas";
  static String linkGetListar = "http://187.87.223.235:8000/api/v1/pesquisas";
  static String linkListarHistorico =
      "http://187.87.223.235:8000/api/v1/respotasPorPessoa";
  static String linkEnviaResposta =
      "http://187.87.223.235:8000/api/v1/respostas";
  static String linkGetPesquisasCliente =
      "http://187.87.223.235:8000/api/pesquisasPorCliente/";

  static String token = "";
  static Map<String, dynamic> descriptedToken = {};

  static int tabSelected = 1;

  // static Widget mudaTela(List<Listar> listar) {
  //   if (tabSelected == 0) {
  //     return HomePage();
  //   } else if (tabSelected == 1) {
  //     return ListarPage(listar);
  //   } else if (tabSelected == 2) {
  //     return HistoricoPage();
  //   } else {
  //     return Container();
  //   }
  // }

  static Map<String, dynamic> descrip() {
    return descriptedToken = JwtDecoder.decode(token);
  }
}
