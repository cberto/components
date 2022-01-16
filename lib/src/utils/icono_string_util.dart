import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'list': Icons.list,
  'tune': Icons.tune,
};
Icon getIcon(String nombreIcono) {
  //regresar un icono dependiendo el string q reciba
  //regresa un nuevo widget un nuevo icon
  return Icon(
    //lo busca y lo retorna
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
