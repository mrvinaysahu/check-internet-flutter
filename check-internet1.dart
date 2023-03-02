import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This is very simple method to check internet connected or not
// first Install package ;-
//connectivity_plus: ^3.0.3

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context,snapshot){
      return Scaffold(
        body: Center(child: snapshot.data==ConnectivityResult.none?Text("not connectsd"):Text("connected"),)
      );
    });
  }
}
