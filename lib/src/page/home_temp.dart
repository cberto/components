/* //pag temporal
import 'package:flutter/material.dart';

//Crear interface
class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tes', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      //listas, registros
      //body: ListView(children: _crearItems()
      body: ListView(children: _crearItemsCorta()

          /* //muetra y permite hacer scroll
        children: <Widget>[
          //lista
          ListTile(
            title: Text('ListTitle Title'),
          ),
          //Separadores
          Divider(),
          ListTile(
            title: Text('ListTitle Title'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTitle Title'),
          )
        ],*/
          ),
    );
  }

//_crearItems retornal lista de los items q mostramos en List view
  List<Widget> _crearItems() {
//crear lista y def el rango
    List<Widget> lista = new List<Widget>();

//opt va hacer uno ,dos etc hasta q llegue al final de la lista
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      //cuando el ciclo for termine tenemos la lista la nueva coleccion de widget
      // lista.add(tempWidget);
      //operador de cascada .. hace referecia a lista .. regresa al operador original
      //lineas separadoras
      //agrega el widget, regrese a la lista y lueggo agrege el divider
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  /*OTRA MANERA DE HACERLO*/
  List<Widget> _crearItemsCorta() {
    //regeresar nueva lista
    //var widgets = opciones.map((item) {
    //resumir mas
    return opciones.map((item) {
      //regresar una lista de widget
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + ' !'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            //flechita >
            trailing: Icon(Icons.keyboard_arrow_right),
            //metodo, parece q se hace click
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    //return widgets;
  }
}
*/
