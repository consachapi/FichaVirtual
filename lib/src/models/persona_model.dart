
class Persona {
  String numeroDocumento;
  String nombres;
  String oficinaAbreviatura;
  String oficina;

  Persona({
    this.numeroDocumento,
    this.nombres,
    this.oficinaAbreviatura,
    this.oficina
  });

  Persona.fromJsonMap(Map<String, dynamic> json){
    numeroDocumento = json['numeroDocumento'];
    nombres = json['nombres'];
    oficinaAbreviatura = json['oficinaAbreviatura'];
    oficina = json['oficina'];
  }

}