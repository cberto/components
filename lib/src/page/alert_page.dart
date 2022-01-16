//import 'dart:html';

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          //enviar argumento (contex)
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      //boton para regresar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reply),
        //cuando se apreta el boton
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  //metodo
  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        //Cerrar alerta hcciendo click afuera
        //ventana emergente, si es t podemos hacer click afuera
        barrierDismissible: true,
        //func encargarga de la aleert
        builder: (context) {
          //regresar widget, mostrar la alerta
          return AlertDialog(
            //Hacer q a alerta muestre borde redondeado
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              //para evitar q se extire, para q se adapte al contenido interno (q tan anchoe es)
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                //logo flutter y def q tan grande sea
                FlutterLogo(size: 100.0)
              ],
            ),
            //lista de widget
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                //forma traddicional
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
