import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//This is second method method to check internet connected or not
// first Install package ;-
//connectivity_plus: ^3.0.3

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isconnected=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSubscription();
  }
  //1-  method of check internet
  checkInternet()async{
    result=await Connectivity().checkConnectivity();
    if(result!=ConnectivityResult.none){
      isconnected=true;
    }else{
      isconnected=false;
      showDialogBox();
    }
    setState(() {});
  }
//dialogbox
  showDialogBox(){
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context)=>CupertinoAlertDialog(

      title: Text("No Internet"),
      content: Text("Please check your internet connection"),
      actions: [CupertinoButton.filled(child: Text("Retry"), onPressed: (){
        Navigator.pop(context);
        checkInternet();
      })],
    ));
  }
  // To start subscription
  startSubscription(){
    subscription=Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Internet"),),
    );
  }
}
