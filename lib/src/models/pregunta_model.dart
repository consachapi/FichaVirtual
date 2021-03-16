
class Preguntas {
  List<Pregunta> items = new List();

  Preguntas();

  Preguntas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null){
      return;
    }

    for(var item in jsonList){
      final pregunta = new Pregunta.fromJsonMap(item);
      items.add(pregunta);
    }
  }

}

class Pregunta {
  int id;
  String descripcion;
  bool respuesta;

  Pregunta({
    this.id, 
    this.descripcion,
    this.respuesta
  });

  Pregunta.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    descripcion = json['descripcion'];
    respuesta = json['respuesta'];
  }

}