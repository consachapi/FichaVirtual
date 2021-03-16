
import 'package:ficha_sintomatologica/src/providers/provider_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ficha_sintomatologica/src/utils/loading_page.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';

class PoliticasPage extends StatelessWidget {
  final providerUsuario = new ProviderUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecundary(),
      appBar: AppBar(
        backgroundColor: colorSecundary(),
        title: Column(
          children: <Widget>[
            Text('GOBIERNO REGIONAL DE CUSCO', style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView(
                children: <Widget>[
                  Text("Ficha sintomatológica COVID 19 para el regreso al trabajo", 
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white70,),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10,),
                  Text("Declaracion Jurada", 
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  SizedBox(height: 50,),
                  Text("Todos los datos expresados en esta aplicación constituyen declaración jurada de mi parte.", 
                    style: TextStyle(fontSize: 20, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30,),
                  Text("He sido informado que de omitir o declarar información falsa, puedo comprometer la salud de mis compañeros de trabajo, y la mia propia, asumiendo las responsabilidad que correspondan.", 
                    style: TextStyle(fontSize: 20, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              child: _buttonSave(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonSave(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        color: colorPrimary(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 17.0),
          child: Text('REGISTRAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
        ),
        onPressed: (){
          LoadingPage loadingPage = LoadingPage(context);
          _registrar(context, loadingPage);
        }
      )
    );
  }

  _registrar(BuildContext context, LoadingPage loadingPage) async{
    loadingPage.show();
    Map resp = await providerUsuario.registrarPolitica();
    if(resp['success']){
      loadingPage.close();
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      loadingPage.close();
      mostrarAlerta(context, 'Ocurrio un error a registrar. Vuelve a intentar nuevamente.');
    }
  }

}