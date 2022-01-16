import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //controlar un scroll
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  //init metodo q no regresa nada
  void initState() {
    //hace ref a  la clase State y la inicializa
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      //se dispara cada vez q se mueva el scroll
      //print('SCROLL!!');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        //traer inf
        fetchData();
      }
    });
  }

  //se dispara cunaod la pagina deja de existir, prevenir fuga de memeoria
  @override
  void dispose() {
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        //stack los apila todos juntos enciam de otro
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      //le pasamos la ref y no el metodo
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        //enlazamos el _scrollController
        controller: _scrollController,
        //cuantos elementos tiene la lista en este intante
        itemCount: _listaNumeros.length,
        //forma como se va mostar los items
        itemBuilder: (BuildContext context, int index) {
          //por la posicones, esas imagenes, vaor de las imageses
          final imagen = _listaNumeros[index];
          //fade porque es una imganed de un recurso externo
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$index'),
            placeholder: AssetImage('assets/circulo.gif'),
          );
        },
      ),
    );
  }

  //para el scroll de cargando
  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    return new Timer(duration, () {
      //cuando pasan los 2 segundos, la purgamos y le sumamos porqeu queremos mas imagenes
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    //obtener los 10 elementos
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
