import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

//----------------Controle de estados Automáticos-------------------------------
part 'item_controller.g.dart';   //  <------------- gera um arquivo de controller EX: "nomedoarquivo.g.dart"
//usar no terminal o seguinte comando:
// flutter pub run build_runner build  <------ gera apenas o arquivo de part ' '
// flutter pub run build_runner watch  <------ monitora mudanças no arquivo gerado
// flutter pub run build_runner clear  <------ limpa todos os arquivos gerados

class ItemController = ItemControllerBase with _$ItemController;

//A utilização do mixin Store é para geração dos códigos automáticos
abstract class ItemControllerBase with Store {

  ItemControllerBase( this.titulo );

    final String titulo;

    @observable
    bool marcado = false;

    void alterarMarcado(bool? valor) => marcado = valor!;

}
