import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/classes/classes.dart';
import 'package:http/http.dart' as http;
import 'package:hackathon/datasources/datasource.dart';

class ApiRemote {
  final _linkListar = "http://187.87.223.235:8000/api/v1/pessoas";
  final _request = HttpRequest();

  String? email;
  String? password;
  String? token;

  ApiRemote({this.email, this.password, this.token});

  Future<http.Response> loginPost() async {
    final _linkLogin = Globais.linkGetLogin;
    // final responsePost = await _request.postJson(link: _linkLogin);
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

  Future<http.Response> listarGet() async {
    final _linkListar = Globais.linkGetListar;

    final content = await http.get(
      Uri.parse(_linkListar),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Autorization': 'bearer ${token}',
      },
    );
    print(content);
    return content;
  }

  Future<List<Login>> get() async {
    final responseGet = await _request.getJson(link: _linkListar);
    return jsonDecode(responseGet);
  }

  List<Login> jsonDecode(List<dynamic> listaDados) {
    List<Login> lista = [];
    return lista = listaDados.map((e) => Login.fromJson(e)).toList();
  }
}
