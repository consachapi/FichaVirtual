
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ficha_sintomatologica/src/models/pregunta_model.dart';
import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';

class ProviderPregunta {
  final prefs = new PreferencesConfig();

  Future<List<Pregunta>> getPregunta() async {
    final resp = await http.get(
      '${ prefs.api }/pregunta/usuario/listar',
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ prefs.token }',
      }
    );
    final decodeResponse = json.decode(resp.body);
    final preguntas = new Preguntas.fromJsonList(decodeResponse['data']);
    return preguntas.items;
  }

}