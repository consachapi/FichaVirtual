
import 'package:ficha_sintomatologica/src/models/campania_model.dart';
import 'package:ficha_sintomatologica/src/models/estado_model.dart';
import 'package:ficha_sintomatologica/src/models/persona_model.dart';

class Encuestas {

  List<Encuesta> items = new List();

  Encuestas();

  Encuestas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null){
      return;
    }

    for(var item in jsonList){
      final encuesta = new Encuesta.fromJsonMap(item);
      items.add(encuesta);
    }
  }

}

class Encuesta {
  int id;
  Campania campania;
  Persona persona;
  Estado estado;

  Encuesta({
    this.id,
    this.campania,
    this.persona,
    this.estado
  });

  Encuesta.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    campania = new Campania.fromJsonMap(json['campania']);
    persona = new Persona.fromJsonMap(json['personal']);
    estado = new Estado.fromJsonMap(json['estado']);
  }

}