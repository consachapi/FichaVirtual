import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';
import 'package:flutter/material.dart';
import 'package:ficha_sintomatologica/src/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesConfig();
  await prefs.initPrefs();

  runApp(FichaSintomatologica());
}