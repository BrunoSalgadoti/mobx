import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_brn/controller.dart';
import 'package:mobx_brn/principal_controller.dart';
import 'package:provider/provider.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final PrincipalController _principalControler = PrincipalController();

  _dialog(){
    showDialog(
        context: context,
        builder: (_){

          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma descrição..."
              ),
              onChanged: _principalControler.setNovoItem,
            ),
            actions: [

              TextButton(
                  onPressed: (){ Navigator.pop(context); },
                  child: const Text("Cancelar", style: TextStyle(
                    color: Colors.red
                  ),)
              ),

              TextButton(
                  onPressed: (){
                    _principalControler.adicionarItem();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final  controller = Provider.of<Controller>(context);

    return Scaffold(

      appBar: AppBar(
        title:  Text(
          "${controller.email}",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),

      body: Observer(
        builder: (_){
          return ListView.builder(
            itemCount: _principalControler.listaItens.length,
            itemBuilder: (_, indice){
              //Item é do tipo ItemController
             var item =  _principalControler.listaItens[indice];
              return Observer(
                  builder: (_){
                    return ListTile(
                      title: Text(
                        item.titulo,
                        style: TextStyle(
                            decoration: item.marcado ?
                            TextDecoration.lineThrough : null
                        ),
                      ),
                      leading: Checkbox(
                        value: item.marcado,
                        onChanged: item.alterarMarcado,
                      ),
                      onTap: (){
                        item.marcado = !item.marcado;
                      },
                    );
                  });
            },
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _dialog();
        },
      ),
    );
  }
}
