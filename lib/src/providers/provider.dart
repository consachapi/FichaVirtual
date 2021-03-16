import 'package:flutter/cupertino.dart';
import 'package:ficha_sintomatologica/src/blocs/login_bloc.dart';


class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider ({Key key, Widget child}){
    if(_instancia == null){
      return new Provider._internal(key:key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}): super(key: key, child: child);
  
  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }

}