import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

//----------------Controle de estados Automáticos-------------------------------
part 'controller.g.dart';   //  <------------- gera um arquivo de controller EX: "nomedoarquivo.g.dart"
//usar no terminal o seguinte comando:
// flutter pub run build_runner build  <------ gera apenas o arquivo de part ' '
// flutter pub run build_runner watch  <------ monitora mudanças no arquivo gerado
// flutter pub run build_runner clear  <------ limpa todos os arquivos gerados

class Controller = ControllerBase with _$Controller;

//A utilização do mixin Store é para geração dos códigos automáticos
abstract class ControllerBase with Store {

  ControllerBase(){

    //autorun Executa sempre que um observável tem eu estado alterado
     autorun((_){

       //Executar o autorun() na pg específica com o:
       // @override
       // void didChangeDependencies
       // super.didChangeDependencies();
       // autorun((_){
       // print(controller.formularioValidado);
       //});

       /*
      print(email);
      print(senha);
     // print(emailSenha);
      print(formularioValidado);
        */
    });

  }

  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  //computed junta os resultados de um ou mais observaveis
  @computed
  String get emailSenha => "$email - $senha";

  //validar campos
  bool get formularioValidado => email.length >= 5 && senha.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async {

    carregando = true;

    //Processando uma simulação de login (pode usar os comandos normais como..
    // o do firebase, para caso de explicação aplicamos esta simulação)
    await Future.delayed(const Duration(seconds: 3));

    carregando = false;
    usuarioLogado = true;
  }


  /* //<----- exemplo do contador
  @observable
  int contador = 0;

  @action
  incrementar(){
    contador++;
  }
*/

}
//------------------------------------------------------------------------------

//--------------------Controle de estado manual---------------------------------
/*

class Controller {

  //var contador = Observable(0);    <-------------
  var _contador = Observable(0);
  Action? incrementar;

  Controller(){
    incrementar = Action(_incrementar);
  }

  //incrementado depois dos codigos comentados
  int get contador => _contador.value;
  set contador(int novoValor) => _contador.value = novoValor;

  _incrementar (){
    //contador.value = contador.value + 1;   <-------------
    contador++;
  }
}
 */
//------------------------------------------------------------------------------
