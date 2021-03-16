
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage {
  final BuildContext _context;

  LoadingPage(this._context);

  void show(){
    showDialog(
      barrierDismissible: false,
      context: _context,
      builder: (context){
        return SpinKitFadingCircle(color: Colors.white);
      }
    );
  }

  void close(){
    Navigator.of(_context).pop();
  }

}