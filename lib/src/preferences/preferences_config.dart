
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesConfig {
  final String _name = 'Ficha Sintomatológica';
  final String _version = '1.0.0';
  final String _autor = 'consachapi@gmail.com';
  final String _organizacion = 'Gobierno Regional de Cusco';
  final String _anio = '2021';
  final bool _politica = false;
  final String _oauth = '';
  final String _api = '';
  static final PreferencesConfig _instancia = new PreferencesConfig._internal();
  SharedPreferences _prefs;

  factory PreferencesConfig(){
    return _instancia;
  }

  PreferencesConfig._internal();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    this._prefs.setString('__name__', _name);
    this._prefs.setString('__version__', _version);
    this._prefs.setString('__autor__', _autor);
    this._prefs.setString('__organizacion__', _organizacion);
    this._prefs.setString('__anio__', _anio);
    this._prefs.setBool('__poltica__', _politica);
    this._prefs.setString('__oauth__', _oauth);
    this._prefs.setString('__api__', _api);
  }

  get name {
    return _prefs.getString('__name__');
  }

  get organizacion {
    return _prefs.getString('__organizacion__');
  }

  get anio {
    return _prefs.getString('__anio__');
  }

  get politica {
    return _prefs.getBool('__poltica__');
  }

  set politica(bool value){
    _prefs.setBool('__poltica__', value);
  }

  get oauth {
    return _prefs.getString('__oauth__');
  }

  get api {
    return _prefs.getString('__api__');
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value){
    _prefs.setString('token', value);
  }

}
