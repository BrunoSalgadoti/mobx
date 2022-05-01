import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_brn/controller.dart';
import 'package:mobx_brn/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  /*  // Usando o setState normal
  int _contador = 0;

  _incrementar(){

    setState(() {
      _contador++;
    });
  }
*/

  late Controller controller;
  dynamic reactionDisposer = ReactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //criando o controller no main.dart pode-se acessar em qualque página...
    // do seu projeto, EX de instancia dom controller: pode-se criar no main.dart
    //vários controles so mudando o tipo EX: <Controler> <Dados> ...
    controller = Provider.of<Controller>(context);

    //autorun((_){
    //  print(controller.formularioValidado);
    //});

    //ou

    //reaction fica sempre carregando se não for "dispose" dispensado
    reaction(
    (_) => controller.usuarioLogado,
    (usuarioLogado) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Principal())
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: const EdgeInsets.all(16),

        child: Column(children:  [

          /* Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(builder: (_){
              return Text(
               // "${controller.contador.value}", <-------------
                "${controller.contador}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 80
                ),);
            },),
          ),*/

          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail
            ),),

          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Senha"),
              onChanged: controller.setSenha,
            ),),

          Padding(
              padding: EdgeInsets.all(16),
              child: Observer(builder: (_){
                return Text(
                    controller.formularioValidado
                        ? "Validado"
                        : "* Campos não validados"

                  //"* Campos não validados: ${controller.emailSenha}" //<---- aparece na tela
                );
              },
              )),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(builder: (_){
              return ElevatedButton(
                onPressed: controller.formularioValidado
                    ? (){controller.logar();}
                    : null,
                //  (){// controller.incrementar();  // <-------------------,
                child:  controller.carregando
                ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),)
                    : const Text(
                  // "Incrementar", // <-------------------
                  "Logar",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30
                  ),) ,
              );
            },)),
        ],),
      ),
    );
  }
}

