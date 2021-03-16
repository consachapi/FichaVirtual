import 'package:ficha_sintomatologica/src/models/encuesta_model.dart';
import 'package:ficha_sintomatologica/src/providers/provider_encuesta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ficha_sintomatologica/src/pages/sintomas_page.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';
import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';

class HomePage extends StatelessWidget {
  final prefs = new PreferencesConfig();
  final providerEncuesta = new ProviderEncuesta();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Container(
        child: Column(
          children: <Widget>[
            _crearFondo(context),
            Flexible(
              child: _listarEncuestas(context)
            ),
          ],
        ),
      )
    );
  }

   Widget _crearFondo(BuildContext context){
    final fondoHeader = Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            colorSecundary(),
            colorPrimary()
          ]
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        )
      ),
    );

    return Stack(
      children: <Widget>[
        fondoHeader,
        Container(
          padding: EdgeInsets.only(top: 35.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.account_circle, color: Colors.white, size: 70,),
              SizedBox(height: 5.0, width: double.infinity,),
              _getUserName(),
              SizedBox(height: 15.0, width: double.infinity,),
              Text('REGISTRO DE FICHAS SINTOMATOLOGICAS', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        )
      ],
    );
  }

  Widget _getUserName(){
    return FutureBuilder(
      future: providerEncuesta.getNombreUsuario(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data.toString(), style: TextStyle(color: Colors.white),);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }

  Widget _listarEncuestas(BuildContext context){
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: providerEncuesta.getEncuestas(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return ListView(children: _loadItems(context, snapshot.data),);
        } else {
          return Container(
            height: size.height * 0.50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }

  List<Widget> _loadItems(BuildContext context, List<Encuesta> encuestas) {
    return encuestas.map((item) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
            child: Card(
              elevation: 1.0,
              color: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 40, minHeight: 40, maxWidth: 40, maxHeight: 40,),
                  child: Image.asset(_getImageEstado(item), fit: BoxFit.cover),
                ),
                title: Text(item.campania.descripcion, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(_getSubtitulo(item), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 13.0)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: (){
                  if(item.estado.id == 1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SintomasPage(id: item.id,)));
                  } else {
                    if(item.estado.id == 2){
                      mostrarAlerta(context, 'Ficha sintomatológica registrado de forma satisfactorio.'); 
                    } else {
                      mostrarAlerta(context, 'Ficha sintomatológica ${item.estado.descripcion}'); 
                    }  
                  }
                },
              ), 
            ),
          ),
        ],
      );
    }).toList();
  }

  String _getImageEstado(Encuesta encuesta){
    String imagen = 'assets/images/anulado.png';
    switch(encuesta.estado.id){
      case 0:
        imagen = 'assets/images/anulado.png';
        break;
      case 1:
        imagen = 'assets/images/pendiente.png';
        break;
      case 2:
        imagen = 'assets/images/llenado.png';
        break;
      case 3:
        imagen = 'assets/images/vacio.png';
        break;
      case 6:
        imagen = 'assets/images/alerta.png';
        break;
    }
    return imagen;
  }

  String _getSubtitulo(Encuesta encuesta){
    if(encuesta.estado.id == 1){
      return 'Abierto hasta ${encuesta.campania.fechaCierre}';
    }
    return '${encuesta.campania.fechaApertura} - ${encuesta.estado.descripcion}';
  }

}