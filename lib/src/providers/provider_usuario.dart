import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';

class ProviderUsuario {
  final prefs = new PreferencesConfig();

  Future<Map<String, dynamic>> login(String usuario, String password) async {
    final authData = {
      'username': usuario,
      'password': password,
      'grant_type': 'password',
      'client_id': 'sipac_mobil'
    };
    final resp = await http.post(
      prefs.oauth,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: Encoding.getByName("utf-8"),
      body: authData
    );

    Map<String, dynamic> decodeResponse = json.decode(resp.body);
    bool verify = false;
    if(decodeResponse.containsKey('access_token')){
      prefs.token = decodeResponse['access_token'];
      final respEstado = await http.get(
        '${ prefs.api }/usuario/estado/' + usuario,
        headers: {
          "Accept": "application/json; charset=UTF-8",
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${ prefs.token }',
        },
      );
      Map<String, dynamic> decodeResponseEstado = json.decode(respEstado.body);
      if(decodeResponseEstado.containsKey('success')){
        if(decodeResponseEstado['success']){
          verify = true;
        }
      }
      return {'success': true, 'verify': verify};
    }
    return {'success': false, 'mensaje': 'error'};
  }

  Future<Map<String, dynamic>> registrarPolitica() async {
    final resp = await http.put(
      '${prefs.api}/usuario/cambiar/estado',
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ prefs.token }',
      },
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