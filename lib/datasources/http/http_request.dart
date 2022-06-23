import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRequest {
  Future<List<dynamic>> getJson({required String link}) async {
    http.Response response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }

  Future<List<dynamic>> postJson({required String link}) async {
    http.Response response = await http.post(Uri.parse(link));
    return json.decode(response.body);
  }
}
