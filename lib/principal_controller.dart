import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_brn/item_controller.dart';

//----------------Controle de estados Automáticos-------------------------------
part 'principal_controller.g.dart';   //  <------------- gera um arquivo de controller EX: "nomedoarquivo.g.dart"
//usar no terminal o seguinte comando:
// flutter pub run build_runner build  <------ gera apenas o arquivo de part ' '
// flutter pub run build_runner watch  <------ monitora mudanças no arquivo gerado
// flutter pub run build_runner clear  <------ limpa todos os arquivos gerados

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//A utilização do mixin Store é para geração dos códigos automáticos
abstract class PrincipalControllerBase with Store {

  @observable
  String novoItem = "";

  @action
  void setNovoItem(String valor) => novoItem = valor;


  //Só observa as alterações em uma lista já criada mas não adiciona na lista
  //para isso criar a lista via ...
  // ObservableList<'tipo"> nomedalista = ObservableList(); EX: Abaixo.
 /* @observable
  List<String> listaItens = [];
  */

  //OBS: não precisa inserir neste caso o  @observable
  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void adicionarItem(){
    listaItens.add(ItemController(novoItem));
    //print(listaItens);
  }


}