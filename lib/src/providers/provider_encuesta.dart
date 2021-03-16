
import 'package:ficha_sintomatologica/src/models/encuesta_model.dart';
import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderEncuesta {
  final prefs = new PreferencesConfig();

  Future<String> getNombreUsuario() async {
    final resp = await http.get(
      '${prefs.api}/usuario/datos',
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ prefs.token }',
      }
    );

    final decodeResponse = json.decode(resp.body);
    if(decodeResponse.containsKey('success')){
      if(decodeResponse['success']){
        return decodeResponse['data'][0]['nombres'];
      }
      return 'Sin nombre';
    }
    return 'Sin nombre';
  }

  Future<List<Encuesta>> getEncuestas() async {
    final resp = await http.get(
      '${prefs.api}/encuesta/usuario/listar',
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ prefs.token }',
      }
    );

    final decodeResponse = json.decode(resp.body);
    final encuestas = new Encuestas.fromJsonList(decodeResponse['data']);
    return encuestas.items;
  }

  Future<Map<String, dynamic>> registrarEncuesta(Map<String, dynamic> formData) async {
    final resp = await http.post(
      '${prefs.api}/encuesta/usuario/registrar',
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ prefs.token }',
      },
      body: json.encode(formData)
    );

    final decodeResponse = json.decode(resp.body);
    if(decodeResponse.containsKey('success')){
      if(decodeResponse['success']){
        return {'success': true};
      }
      return {'success': false};
    }
    return {'success': false};
  }
  
}