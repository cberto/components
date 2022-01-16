//import 'dart:html';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
                //todo espacio posible q tiene
                child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      //divisions: 20,
      value: _valorSlider,
      //neceista el valor max y min
      min: 10.0,
      max: 400.0,
      //verifica si el _bloquearCheck esta habilitado,  es v o f,
      //si no existe regresa un null
      //si esta activo lo bloquea caso contrario llama al metodo
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //  value: _bloquearCheck,
    //  onChanged: (valor) {
    //   setState(() {
    //     _bloquearCheck = valor;
    //   });
    // },
    // );

    //otro metodo
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://miro.medium.com/max/1104/1*gnILQrKStJ6UrGGeYnR9zw.png'),
      width: _valorSlider,
      //para q no se salga de sus margenes
      fit: BoxFit.contain,
    );
  }
}
