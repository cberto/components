//Si hay muchas rutas, copiamos la de main.dart

import 'package:flutter/material.dart';

import 'package:componentes/src/page/home_page.dart';
import 'package:componentes/src/page/alert_page.dart';
import 'package:componentes/src/page/avatar_page.dart';
import 'package:componentes/src/page/card_page.dart';
import 'package:componentes/src/page/animated_container.dart';
import 'package:componentes/src/page/input_page.dart';
import 'package:componentes/src/page/slider_page.dart';
import 'package:componentes/src/page/listview_page.dart';

//metodo q regresa un string, llamamos un metdo get
Map<String, WidgetBuilder> getApplicationRoutes() {
//lo q regresamos
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    //por si cambia la ruta la otra opcion es:
    //AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
