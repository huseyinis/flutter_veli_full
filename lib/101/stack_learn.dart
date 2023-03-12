import 'package:flutter/material.dart';

//bır yerde ust uste bınmıs wıdgetlar varsa orda stack kullanılmıstır
//stackte en son verdıgımız property en ustte cıkar
//yanı en alta yazdıgımız wıdget en ustte durur ekranda
class StackLearn extends StatelessWidget {
  const StackLearn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.blue,
              height: 100,
            ),
          ),
          Positioned(
              //varsayılan olarak ekranı kaplar
              //ıstersek ekranın neresınden ne kadar bosluk
              //bırakmak sıtedıgımızı ayarlayabılrıız
              //ıstersek right left vermeyıp widthte verebılırız
              right: 0,
              left: 0,
              top: 25,
              height: 100,
              child: Container(color: Colors.pink)),
          Positioned(
              width: 25,
              bottom: 0,
              height: 100,
              child: Container(color: Colors.teal)),
          Positioned.fill(
              //height width propertylerı yoktur sadece boslukları
              // verırız ona gore kaplar alanı
              child: Container(
            color: Color.fromARGB(255, 127, 200, 234),
          ))
        ],
      ),
    );
  }
}
