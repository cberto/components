//mateapp aplicacion basica
import 'package:componentes/src/page/alert_page.dart';
//import 'package:componentes/src/page/avatar_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

//import 'package:componentes/src/page/home_page.dart';
//import 'package:componentes/src/page/home_temp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //cambiar idioma (ssacado desde la pag)
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'),
      ],
      //home: HomePageTemp());
      // home: HomePage());
      //def rutas , / string
      initialRoute: '/',
      //llamamos al metodo getApplicationRoutes de routes.dart
      routes: getApplicationRoutes(),
      //Si una ruta no esta def en routes entra el onGenerate
      //fun q regesa una ruta dinamica
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');
        //redirigirr al alert
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
