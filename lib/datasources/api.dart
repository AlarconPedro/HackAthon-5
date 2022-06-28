import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:hackathon/classes/globais.dart';
import 'package:hackathon/datasources/models/historico.dart';
import 'package:hackathon/datasources/models/listar.dart';
import 'package:http/http.dart' as http;
import 'package:hackathon/datasources/datasource.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiRemote {
  final _linkListar = "http://187.87.223.235:8000/api/v1/pessoas";
  final _request = HttpRequest();

  String? email;
  String? password;
  String? id_pesquisa;
  String? id_pessoa;
  String? token = Globais.token;

  final List<Listar>? listar;

  ApiRemote({this.email, this.password, this.token, this.listar});

  // Efetua uma requisição POST para a API com o campo E-Mail e Password como parametro.
  Future<http.Response> loginPost() async {
    final _linkLogin = Globais.linkGetLogin;
    return http.post(
      Uri.parse(_linkLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email!,
        'password': password!,
      }),
    );
  }

  // Efetua uma requisição POST para a API com o campo Token como parametro.
  Future<http.Response> enviaResposta(TextEditingController controller1,
      controller2, controller3, int pesquisaId) async {
    final _linkEnviaResposta = Globais.linkEnviaResposta;
    return http.post(
      Uri.parse(_linkEnviaResposta),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Autorization':
            'bearer ${Globais.token}', // O token é obtido no loginPost().
      },
      body: jsonEncode(<String, String>{
        'resposta1': controller1.text,
        'resposta2': controller2.text,
        'resposta3': controller3.text,
        'pesquisa_id': pesquisaId.toString(),
        'pessoa_id': "39",
      }),
    );
  }

  // Future<List<Historico>> listarHistorico_old() async {
  //   const _linkListarHistorico =
  //       "http://187.87.223.235:8000/api/v1/respostasPorPessoa/5";
  //   final response = await http.get(
  //     Uri.parse(_linkListarHistorico),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Autorization':
  //           'bearer ${Globais.token}', // O token é obtido no loginPost().
  //     },
  //   );
  //   return (json.decode(response.body) as List)
  //       .map((e) => Historico.fromJson(e))
  //       .toList();
  //   // final tokeDescript = await jwtDecoder(Globais.token);
  //   // return recuperaDadosToken(tokeDescript);
  // }

  // Future<http.Response> listarDadosWeb() async {
  //   final _linkListar = Globais.linkGetListarJWT;
  //   final response = await http.get(
  //     Uri.parse(_linkListar),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   return response;
  // }

  // Future<Map<String, dynamic>> jwtDecoder(String token) async {
  //   final decodedToken = JwtDecoder.decode(token);
  //   return decodedToken;
  // }

  // List<Listar>? recuperaDadosToken(Map<String, dynamic> mapa) {
  //   for (var i = 0; i < mapa.length; i++) {
  //     final Listar listar = Listar(
  //       id_pesquisa: mapa[i]['id_pesquisa'],
  //       id_pessoa: mapa[i]['id_pessoa'],
  //       descricao: mapa[i]['descricao'],
  //       perguntas: mapa[i]['perguntas'],
  //       status: mapa[i]['status'],
  //       tema: mapa[i]['tema'],
  //     );
  //     listar.add(listar);
  //   }
  //   return listar;
  // }

  // Efetua uma requisição GET para a API para listar as Pesquisas de Satisfação, retorna o Token.
  // Future<http.Response> listarGet() async {
  //   final _linkListar = Globais.linkGetListar;

  //   final content = await http.get(
  //     Uri.parse(_linkListar),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Autorization': 'bearer $token',
  //     },
  //   );
  //   return content;
  // }

  Future<List<Listar>> listarPesquisasCliente() async {
    final _linkListar = Globais.linkGetListar;
    final response = await http.get(
      Uri.parse(_linkListar),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return (json.decode(response.body) as List)
        .map((e) => Listar.fromJson(e))
        .toList();
  }

  Future<List<Historico>> listarHistorico() async {
    final _linkListar =
        "http://187.87.223.235:8000/api/v1/respostasPorPessoa/39";
    final response = await http.get(
      Uri.parse(_linkListar),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Globais.token}',
      },
    );
    return (json.decode(response.body) as List)
        .map((e) => Historico.fromJson(e))
        .toList();
  }

  Future<List<Listar>> get() async {
    final listaDados = await _request.getJson(link: Globais.linkGetListar);
    return _popularLista(listaDados);
  }

  List<Listar> _popularLista(List<dynamic> listaDados) {
    List<Listar> listaRetorno = [];
    for (var i = 0; i < listaDados.length; i++) {
      listaRetorno.add(Listar.fromJson(listaDados[i]));
    }
    return listaRetorno;
  }
}
