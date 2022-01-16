//lo q continee para leer el json show rootBundle
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    //metodo llamar
    //cargarData();
  }
//se contruya cuando todo el proceso termina
//Resuelve la lista, retorna la inf o nlista dynamic
  Future<List<dynamic>> cargarData() async {
    //regresa eun future
    //almacenamos toda la inf en respuesta
    final resp = await rootBundle.loadString('data/menu_opts.json');
    //resp toda la data q viene del servicio
    Map dataMap = json.decode(resp);

    //print(dataMap['rutas']);
    //mandamos a llenar las opciones
    opciones = dataMap['rutas'];
    return opciones;
  }
}

//intancia,  el archivo menuprovider solo expone la intancia creada del _menu
final menuProvider = new _MenuProvider();
