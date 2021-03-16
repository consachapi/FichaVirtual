
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Info', style: TextStyle(color: colorPrimary(), fontSize: 15.0, fontWeight: FontWeight.bold)),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text('Aceptar', 
              style: TextStyle(color: colorPrimary(), fontSize: 15.0, fontWeight: FontWeight.bold)
            )
          )
        ],
      );
    }
  );
}

Color colorPrimary(){
  return Color.fromRGBO(240, 20, 60, 1.0);
}

Color colorSecundary(){
  return Color.fromRGBO(165, 42, 42, 1.0);
}

Color colorCirculo(){
  return  Color.fromRGBO(255, 255, 255, 0.07);
}

String logo(){
  return 'assets/images/logo.png';
}

String ficha(){
  return 'assets/images/ficha.png';
}

String llenado(){
  return 'assets/images/llenado.png';
}

String vacio(){
  return 'assets/images/vacio.png';
}

String pendiente(){
  return 'assets/images/pendiente.png';
}

String anulado(){
  return 'assets/images/anulado.png';
}