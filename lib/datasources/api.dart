import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:http/http.dart' as http;
import 'package:hackathon/datasources/datasource.dart';

class ApiRemote {
  final _linkListar = "http://187.87.223.235:8000/api/v1/pessoas";
  final _request = HttpRequest();

  String email;
  String password;

  ApiRemote({required this.email, required this.password});

  // Future<List<Login>> post() async {
  //   final _linkLogin =
  //       "http://187.87.223.235:8000/api/login${email}/${password}";
  //   final responsePost = await _request.postJson(link: _linkLogin);
  //   return jsonDecode(responsePost);
  // }

  Future<http.Response> post() async {
    final _linkLogin = "http://187.87.223.235:8000/api/login";
    // final responsePost = await _request.postJson(link: _linkLogin);
    return http.post(
      Uri.parse('http://187.87.223.235:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
  }

  Future<List<Login>> get() async {
    final responseGet = await _request.getJson(link: _linkListar);
    return jsonDecode(responseGet);
  }

  List<Login> jsonDecode(List<dynamic> listaDados) {
    List<Login> lista = [];
    return lista = listaDados.map((e) => Login.fromJson(e)).toList();
  }

  /// Fazer validação de campo login e criar tela de login no app ///////////////////////////////////////////////////////////////////////////////
  /// // for (var i = 0; i < listaDados.length; i++) {
  //   lista.add(Login.fromJson(listaDados[i]));
  // }
  // return [
  //   Login(
  //     id: listaDados[0]["id"].toString().toInt(),
  //     usuario: listaDados[0]["usuario"],
  //     senha: listaDados[0]["senha"],
  //   ),
  //   Login(
  //     id: listaDados[1]["id"].toString().toInt(),
  //     usuario: listaDados[1]["usuario"],
  //     senha: listaDados[1]["senha"],
  //   ),
  // ];
}
