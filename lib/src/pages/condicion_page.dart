
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';

class CondicionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecundary(),
      appBar: AppBar(
        backgroundColor: colorSecundary(),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView(
                children: <Widget>[
                  Text("Términos y condiciones de uso de la aplicación", 
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white70,),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20,),

                  Text('Estos Términos y Condiciones regulan la descarga, acceso y utilización de la aplicación móvil FichaGORE (en adelante, la “APLICACIÓN”), que GOBIERNO REGIONAL DE CUSCO, ponen a disposición de los usuarios. Esta versión de la APLICACIÓN está disponible de forma gratuita. El acceso a la APLICACIÓN supone que el usuario reconoce ha aceptado y consentido sin reservas de las presentes condiciones de uso.',
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("La APLICACIÓN tiene el objetivo para registrar la ficha sintomatologica que constituye una declaracion jurada, para lo cual debe ser llenado de forma veraz por los trabajadores del Gobierno Regional de Cusco. En el diseño y desarrollo de esta APLICACIÓN han intervenido profesionales especialistas así como un grupo de usuarios que participaron en el periodo de prueba. La APLICACIÓN se pone a disposición de los usuarios para su uso personal (nunca empresarial). Funciona en un teléfono móvil Android.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("Los derechos de propiedad intelectual e industrial sobre la APLICACIÓN son titularidad de GOBIERNO REGIONAL DE CUSCO, correspondiéndole el ejercicio exclusivo de los derechos de explotación de los mismos en cualquier forma y, en especial, los derechos de reproducción, distribución, comunicación pública y transformación.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("El usuario reconoce que la reproducción, modificación, distribución, comercialización, descompilación, desensamblado, utilización de técnicas de ingeniería inversa o de cualquier otro medio para obtener el código fuente, transformación o publicación de cualquier resultado de pruebas de referencias no autorizadas de cualquiera de los elementos y utilidades integradas dentro del desarrollo constituye una infracción de los derechos de propiedad intelectual de GOBIERNO REGIONAL DE CUSCO,  obligándose, en consecuencia, a no realizar ninguna de las acciones mencionadas", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("La APLICACIÓN utilizará el centro de datos del GOBIERNO REGIONAL DE CUSCO, para almacenar la información de la ficha sintomatológica que el usuario registre mediante esta APLICACION", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("GOBIERNO REGIONAL DE CUSCO, se reserva la facultad de efectuar, en cualquier momento y sin necesidad de previo aviso, modificaciones y actualizaciones en la APLICACIÓN. Asimismo, también se reserva el derecho a modificar los presentes Términos y Condiciones con el objetivo de adaptarlos a las posibles novedades legislativas y cambios en la propia APLICACIÓN, así como a las que se puedan derivar de los códigos tipos existentes en la materia o por motivos estratégicos o corporativos.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("GOIERNO REGIONAL DE CUSCO, se reserva el derecho de editar, actualizar, modificar, suspender, eliminar o finalizar los servicios ofrecidos por la Aplicación, incluyendo todo o parte de su contenido, sin necesidad de previo aviso, así como de modificar la forma o tipo de acceso a esta.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("GOIERNO REGIONAL DE CUSCO, no será responsable del uso de la APLICACIÓN por un menor de edad, siendo la descarga y uso de la APLICACIÓN de la exclusiva responsabilidad del usuario.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("La APLICACIÓN se presta “tal y como es” y sin ninguna clase de garantía. GOIERNO REGIONAL DE CUSCO. no se hace responsable de la calidad final de la APLICACIÓN ni de que ésta sirva y cumpla con todos los objetivos de la misma. No obstante lo anterior, GOIERNO REGIONAL DE CUSCO, se compromete en la medida de sus posibilidades a contribuir a mejorar la calidad de la APLICACIÓN, pero no puede garantizar la precisión ni la actualidad del contenido de la misma.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15,),
                  Text("La responsabilidad de uso de la APLICACIÓN corresponde solo al usuario. Salvo lo establecido en estos Términos y Condiciones, GOBIERNO REGIONAL DE CUSCO. no es responsable de ninguna pérdida o daño que se produzca en relación con la descarga o el uso de la APLICACIÓN, tales como los producidos como consecuencia de fallos, averías o bloqueos en el funcionamiento de la APLICACIÓN (por ejemplo, y sin carácter limitativo: error en las líneas de comunicaciones, defectos en el hardware o software de la APLICACIÓN o fallos en la red de Internet). Igualmente, GOIERNO REGIONAL DE CUSCO, tampoco será responsable de los daños producidos como consecuencia de un uso indebido o inadecuado de la APLICACIÓN por parte de los usuarios.", 
                    style: TextStyle(fontSize: 15, color: Colors.white70), 
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
              child: _buttonAceptar(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonAceptar(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        color: colorPrimary(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 17.0),
          child: Text('ACEPTO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
        ),
        onPressed: (){
          Navigator.pop(context);
        }
      )
    );
  }

}