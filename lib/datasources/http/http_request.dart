import 'package:hackathon/classes/classes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

class HttpRequest {
  Future<List<dynamic>> getJson({required String link}) async {
    http.Response response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }

  Future<List<dynamic>> postJson({required String link}) async {
    http.Response response = await http.post(Uri.parse(link));
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getToken() async {
    final _linkListar = Globais.linkGetListar;

    final content = await http.get(
      Uri.parse(_linkListar),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Autorization': 'bearer ${Globais.token}',
      },
    );
    return JwtDecoder.decode(content.body);
  }
}
