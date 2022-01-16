import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      //crear muchas tarjetas listview
      body: ListView(
        //distancia borde
        padding: EdgeInsets.all(10.0),
        //recibe varios
        children: <Widget>[
          _cardTipo1(),
          //espacio entre las tarjetas
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          //espacio entre las tarjetas
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          //espacio entre las tarjetas
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          //espacio entre las tarjetas
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      //q tan alta va a hacer la tarjeta la sombra
      elevation: 30.0,
      //mas pronunciado los bordes de la tarjeta
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            //leding widget al inicio
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('ってこれは生滅の法である。この生と滅とを超えたところに、真の大楽がある）の意訳であると説明した'),
          ),
          //botones de manera horizonal
          Row(
            //botonoes a la derecha o al final
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    //cambiamos el return por final
    final card = Container(
      //Clip.antiAlias a lo q este en la tarjeta nada se salga del contenido
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          //para el tiempo de las imagenes
          FadeInImage(
            image: NetworkImage(
                'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
            //mostrar img de los assets
            placeholder: AssetImage('assets/jar-loading.gif'),
            //acelerar la foto para q se vea mas rapido
            fadeInDuration: Duration(milliseconds: 300),

            //alto
            height: 300.0,
            //indicar cuanto tiene q ocupar la imagen
            fit: BoxFit.cover,
          ),
          //Image(
          //   image: NetworkImage(
          //       'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Lorem ipsum dolor sit amet'),
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
          //color: Colors.red
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.red,
                //double,
                blurRadius: 10.0,
                //Para extender
                spreadRadius: 2.0,
                //posicion dependiendo los valores de x y y la sombra (invertido)
                offset: Offset(2.0, 10.0))
          ]),
      //permite cortar cualquier cosa q este fuera del contenedor
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
