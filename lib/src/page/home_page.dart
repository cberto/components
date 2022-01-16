import 'package:componentes/src/page/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icono_string_util.dart';

//future: tiene varios estados cuando se está
//pidiendo información cuando se resuelve o cuando da un error esos son los tres estados que nos interesan
//y nosotros podemos reaccionar dependiendo de cualquier cosa que suceda

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //llammamos a la intancia de menProvider y la mostramos
    //print(menuProvider.opciones);
    //menuProvider.cargarData();
    //leer un json para agregaer opciones
    //return ListView(
    //  children: _listaItems(),
    // );
//futurebuilder es una caracteristica
    return FutureBuilder(
      //cargardata regresa un future
      future: menuProvider.cargarData(),
//la inf q tiene por defecto q no sea resulta
      initialData: [],
      //builder recibe una funcion q tiene como argumento el build y tiene la respuesta
      //algo q permite redibujar
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //inf de la ruta q viene del json
        // print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    /* return [
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
    ];*/
    final List<Widget> opciones = [];
    //validacion porq la data viene vacia
    /*if (data == null) {
      return [];
    } */
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        /*leading: Icon(
          Icons.account_circle,
          color: Colors.blue,
        ),*/
        //getIcon necesita el nombre del Icon y el nombre del icono esta en opt
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        //sirve para hacer la navegaciion
        onTap: () {
          //q ruta navegaar, def en main
          Navigator.pushNamed(context, opt['ruta']);

          /*  //navegar en nueva pantalla
          //context pagina q sigue o la q regresamos
          //route
          final route = MaterialPageRoute(builder: (context) => AlertPage());
          //route navega a la siguiente pantalla
          Navigator.push(context, route);
          */
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    //regresar las opciones
    return opciones;
  }
}
