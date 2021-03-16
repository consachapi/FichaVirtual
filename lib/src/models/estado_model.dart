
class Estados {
  List<Estado> items = new List();

  Estados();

  Estados.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null){
      return;
    }
    for(var item in jsonList){
      final estado = new Estado.fromJsonMap(item);
      items.add(estado);
    }
  }

}

class Estado {
  int id;
  String descripcion;

  Estado({this.id, this.descripcion});

  Estado.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    descripcion = json['descripcion'];
  }

}