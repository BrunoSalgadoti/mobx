import 'package:flutter/material.dart';
import 'package:mobx_brn/home.dart';
import 'package:provider/provider.dart';
import 'controller.dart';



//Usando o void main(){} com Provider
void main (){
  runApp(MultiProvider(
    //create: (_) => Controller(),  <------ só provider sem MultiProvider
    providers: [
      Provider<Controller>(
        create: (_) => Controller(),
      )

    ],


    child: const MaterialApp(

      home: Home(),

    ),
  ));
}


/*
void main() {
  runApp( MaterialApp(
    title: "Aplicando MobX",

    home: Home(),


    debugShowCheckedModeBanner: false,
  ));
}
*/