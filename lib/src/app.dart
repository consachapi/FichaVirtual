import 'package:ficha_sintomatologica/src/pages/condicion_page.dart';
import 'package:ficha_sintomatologica/src/pages/politicas_page.dart';
import 'package:ficha_sintomatologica/src/pages/sintomas_page.dart';
import 'package:ficha_sintomatologica/src/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:ficha_sintomatologica/src/pages/login_page.dart';
import 'package:ficha_sintomatologica/src/pages/home_page.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';

class FichaSintomatologica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: colorPrimary(),
        ),
        title: 'Ficha Sintomatológica',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'sintoma' : (BuildContext context) => SintomasPage(),
          'politica' : (BuildContext context) => PoliticasPage(),
          'condicion' : (BuildContext context) => CondicionPage()
        }
      ),
    );
  }
}