import 'package:ficha_sintomatologica/src/models/pregunta_model.dart';
import 'package:ficha_sintomatologica/src/providers/provider_encuesta.dart';
import 'package:ficha_sintomatologica/src/providers/provider_pregunta.dart';
import 'package:ficha_sintomatologica/src/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';

class SintomasPage extends StatefulWidget {
  final int id;

  @override
  SintimaPageRegistro createState() => SintimaPageRegistro(id: id);

  SintomasPage({this.id});
  
}

class SintimaPageRegistro extends State {
  final int id;
  final providerPregunta = new ProviderPregunta();
  final providerEncuesta = new ProviderEncuesta();
  final detalleMedicamentos = TextEditingController();
  List<Pregunta> listarPreguntas;

  SintimaPageRegistro({this.id});

  @override
  void initState() {
    super.initState();
    _getPreguntas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: colorSecundary(),
        title: Column(
          children: <Widget>[
            Text('', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView(children: _loadItems(context)),
            ),
            Divider(height: 2.0, color: Colors.white, thickness: 2,),
            Container(
              width: double.infinity,
              height: 80,
              child: _buttonSave(context),
            )
          ],
        ),
      ),
    );
  }
  bool loading = false;
  _getPreguntas() async {
    final data = await providerPregunta.getPregunta();
    setState((){
      listarPreguntas = data;
      loading = true;
    });
  }

  List<Widget> _loadItems(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> list = [];
    list.add(_pregunaPrincipal());
    if(loading){
      for(Pregunta item in listarPreguntas){
        Widget comp = Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                _preguntaTitulo(item.id, item.descripcion),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Transform.scale( 
                          scale: 1.5,
                          child: Switch(
                            value: item.respuesta,
                            activeColor: colorPrimary(),
                            activeTrackColor: Colors.red[200],
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            onChanged: (bool value) {
                              setState(() {
                                item.respuesta = value;
                              });
                            },
                          )
                        ),
                      ), 
                    ]
                  ),
                ),
                (item.id == 6) ?  _detalleMedicamento() : Text('')
              ],
            ),
          ),
        );
        list.add(comp);
      }
    } else {
      list.add(
        Container(
          height: size.height * 0.60,
          child: Center(
            child: CircularProgressIndicator()
          )
        )
      );
    }
    return list;
  }

  Widget _pregunaPrincipal(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text('En los últimos 14 dias, he tenido alguno de los sintomas siguientes:',
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _preguntaTitulo(int numero, String preguntaDescripcion){
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
      title: Text(preguntaDescripcion, style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
      leading: Container(
        padding: EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red[300],
        ),
        child: new Text(numero.toString(), style: new TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _detalleMedicamento(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: detalleMedicamentos,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: 'Detallar ¿cuál o cuales?',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide( color: Colors.red,
                )
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0)
              )
            ),
          ),
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
          child: Text('GUARDAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
        ),
        onPressed: (){
          LoadingPage loadingPage = LoadingPage(context);
          _guardarRespuesta(loadingPage);
        }
      )
    );
  }

  void _guardarRespuesta(LoadingPage loading) async {
    List<Map<String, dynamic>> rptas = [];
    for(Pregunta pregunta in listarPreguntas){
      Map<String, dynamic> item = {
        'pregunta': pregunta.id, 
        'respuesta': pregunta.respuesta, 
        'observacion': (pregunta.id == 6) ? detalleMedicamentos.text : ''
      };
      rptas.add(item);
    }
    final Map<String, dynamic> _formData = {
      'encuesta': id,
      'respuestas': rptas,
    };

    loading.show();
    var resp = await providerEncuesta.registrarEncuesta(_formData);
    if(resp['success']){
      loading.close();
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      loading.close();
      mostrarAlerta(context, 'No se pudo registrar las respuestas, intente nuevamente.');
    }
    
  }

}