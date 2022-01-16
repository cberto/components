import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
//Crear una propiedad estatica dentro de avatar page
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        //coelccion de widget
        actions: <Widget>[
          //otro cicle
          //para meter dentro de un container ctl + . en circle
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1920/1*x6UxqrsSTz8rnWNZh8FR3Q.jpeg'),
              radius: 25.0,
            ),
          ),
          Container(
            //separacion
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('JP'),
              backgroundColor: Colors.pinkAccent,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/Adorable.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
                'https://image.freepik.com/vector-gratis/ilustracion-paisaje-japon_1284-32852.jpg')),
      ),
    );
  }
}
