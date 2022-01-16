import 'package:flutter/material.dart';

//para manejar la caja de texto y jugar con la inf
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Para capturar los datos
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = [
    'Volar',
    'Rayos',
    'Super fuerza',
    'Rayos X',
    'Flash'
  ];

  //asignar valor a la caja de texto
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      //despliegue (scroll)
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdow(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //para cargar el teeclado automaticamente
      //autofocus: true,
      //capitalizacion obligar q sea por letra, en este caso La primera letra en mayuscula
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //q tan pronunciado sea los bordes con el out
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //etiqueta
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        //debajo del input
        helperText: 'Solo es el nombre',
        //icono dentro del input
        suffixIcon: Icon(Icons.accessibility),
        //icon normal a la izq
        icon: Icon(Icons.account_circle),
      ),
      //funcion q recibe metodo
      onChanged: (valor) {
        //print(_nombre);
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          //q tan pronunciado sea los bordes con el out
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta

          hintText: 'Email',
          labelText: 'Email',
          //icono dentro del input
          suffixIcon: Icon(Icons.alternate_email),
          //icon normal a la izq
          icon: Icon(Icons.email),
        ),
        //funcion q recibe metodo
        onChanged: (valor) =>
            //print(_nombre);
            setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          //q tan pronunciado sea los bordes con el out
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta

          hintText: 'Password',
          labelText: 'Password',
          //icono dentro del input
          suffixIcon: Icon(Icons.lock_open),
          //icon normal a la izq
          icon: Icon(Icons.lock),
        ),
        //funcion q recibe metodo
        onChanged: (valor) =>
            //print(_nombre);
            setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
//quitar seleccion activa
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        //q tan pronunciado sea los bordes con el out
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //etiqueta

        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        //icono dentro del input
        suffixIcon: Icon(Icons.perm_contact_calendar),
        //icon normal a la izq
        icon: Icon(Icons.calendar_today),
      ),
      //lanzar selector
      onTap: () {
        //sacar el foco
        FocusScope.of(context).requestFocus(new FocusNode());
        //click o tap en ese elemento
        _selectDate(context);
      },
    );
  }

  //lanzar la ventana q permita selecc fecha
  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      //en q espacio colocar
      context: context,
      initialDate: new DateTime.now(),
      //restringir nuestroo selector
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2050),
      //cambiar idioma
      locale: Locale('es', 'ES'),
    );

    //validacion
    if (picked != null) {
      //redibujar
      setState(() {
        _fecha = picked.toString();
        //colocar el valor q la persona selecciono o la caja de texto
        _inputFieldDateController.text = _fecha;
      });
    }
  }

//crear lista
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    //nueva lista q retorna
    List<DropdownMenuItem<String>> lista = new List();
    //agregar elementos a la lista
    _poderes.forEach((poder) {
      //tomar a la lista temporar y añadirle el poder
      lista.add(DropdownMenuItem(
        //child lo q muesta
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdow() {
    //personalizar
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        //separar el icono
        SizedBox(
          width: 25.0,
        ),
        Expanded(
          child: DropdownButton(
            //le especificamos el  valor actual de la seleecionada
            value: _opcionSeleccionada,
            //tipo dynamic
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              // print(opt);
              //para q quede seleccionada la opcion
              setState(() {
                //la lista seleccionada sea igual a la opcion q esta seleccionando
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      //muestre la opcion seleccionada
      trailing: Text(_opcionSeleccionada),
    );
  }
}
