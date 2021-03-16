import 'package:ficha_sintomatologica/src/blocs/login_bloc.dart';
import 'package:ficha_sintomatologica/src/pages/condicion_page.dart';
import 'package:ficha_sintomatologica/src/providers/provider_usuario.dart';
import 'package:flutter/material.dart';
import 'package:ficha_sintomatologica/src/preferences/preferences_config.dart';
import 'package:ficha_sintomatologica/src/utils/utils.dart';
import 'package:ficha_sintomatologica/src/utils/loading_page.dart';
import 'package:ficha_sintomatologica/src/providers/provider.dart';

class LoginPage extends StatelessWidget {
  final prefs = new PreferencesConfig();
  final providerUsuario = new ProviderUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginFondo(context)
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;
    final fondoHeader = Container(
      height: size.height * 0.46,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            colorSecundary(),
            colorPrimary()
          ]
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90)
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: colorCirculo()
      ),
    );

    return Stack(
      children: <Widget>[
        fondoHeader,
        Positioned(top: 80.0, left: 65.0, child: circulo),
        Positioned(top: -40.0, left: -50.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 90.0),
          child: Column(
            children: <Widget>[
              new Image.asset(logo(), width: 220.0),
              SizedBox(height: 15.0, width: double.infinity,)
            ],
          ),
        )
      ],
    );
  }

  Widget _loginFondo(BuildContext context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(height: 200,),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                _crearUsuario(bloc),
                SizedBox(height: 30.0,),
                _crearPassword(bloc),
                SizedBox(height: 30.0,),
                _crearButton(bloc)
              ],
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CondicionPage())), 
            child: Text('Términos y condiciones de uso.', style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0,),
          Text('\u00a9${prefs.anio}, ${prefs.organizacion}.', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0)),
        ],
      ),
    );
  }

  Widget _crearUsuario(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.usuarioStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
              ),
              prefixIcon: Icon(Icons.person, color: Colors.red,),
              labelText: 'Usuario',
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            onChanged: bloc.changeUsuario,
          ),
        );
      }
    );
  }

  Widget _crearPassword(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              prefixIcon: Icon(Icons.vpn_key, color: Colors.red,),
              labelText: 'Contraseña',
              errorText: snapshot.error,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearButton(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 104.0, vertical: 17.0),
            child: Text('Ingresar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          elevation: 0.0,
          color: colorPrimary(),
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () {
            LoadingPage loadingPage = LoadingPage(context);
            _login(bloc, context, loadingPage);
          } : null,
        );
      }
    );
  }

  _login(LoginBloc bloc,  BuildContext context, LoadingPage loadingPage) async{
    loadingPage.show();
    Map resp = await providerUsuario.login(bloc.usuario, bloc.password);
    if(resp['success']){
      loadingPage.close();
      if(resp['verify']){
        Navigator.pushReplacementNamed(context, 'home');
      }else{
        Navigator.pushReplacementNamed(context, 'politica');
      }
    } else {
      loadingPage.close();
      mostrarAlerta(context, 'El usuario o contraseña es incorrecta');
    }
  }

}
