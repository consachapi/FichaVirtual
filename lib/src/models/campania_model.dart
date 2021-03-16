
import 'package:ficha_sintomatologica/src/models/estado_model.dart';

class Campania {
  int id;
  String descripcion;
  String fechaApertura;
  String fechaCierre;
  Estado estado;

  Campania({
    this.id,
    this.descripcion,
    this.fechaApertura,
    this.fechaCierre,
    this.estado
  });

  Campania.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    descripcion = json['descripcion'];
    fechaApertura = json['fechaApertura'];
    fechaCierre = json['fechaCierre'];
    estado = new Estado.fromJsonMap(json['estado']);
  }

}