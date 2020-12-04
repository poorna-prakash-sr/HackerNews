




import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading(BuildContext context) {
  return Container(
   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          
          SizedBox(height: 20,),
          SpinKitRotatingPlain(
  color: Colors.indigo,
  size: 50.0,

),
        ],
      ),
    );
}
