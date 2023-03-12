import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            //paddingin tersi olarak dusun padding ıcerıyı kısıtlar margın dısarıyı kısıtlar
            margin: ProjectMargins.cardMargin,

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: 100,
              width: 500,
              child: Center(child: Text('Ali')),
            ),
          ),
          Card(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
            //coloru vs tema kullanarak almak vermek daha dogru
            //ılerde degısıklık yapmayı cok daha kolay hale getırır.
            color: Theme.of(context).colorScheme.error,
          ),
          //alttakı uzun uzun acıkladıgım seyın kullanımı
          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}

class _CustomCard extends StatelessWidget {
  //widget turunde child degıskenı olusturduk cunku degıskenlerı vs
  //burda veremeyız sadece Card wıdgetı ıle ılgılı
  //bılgıler verebılıyoruz bu yuzden child diye widget turunde verı olusturduk
  //constructor ıle required turunde child istedik ve yukarda bu verılerı verdık
  final Widget child;
  _CustomCard({super.key, required this.child});
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Card(
        //paddingin tersi olarak dusun padding ıcerıyı kısıtlar margın dısarıyı kısıtlar
        margin: ProjectMargins.cardMargin,
        shape: roundedRectangleBorder,
        child: child);
  }
}
//Borders
//StadiiumBorder()--->>> Stadyum seklıne benzer
//CircleBorder() --->>> yuvarlak seklınde
// RoundedRectangleBorder()--->>>koselerden ovallestırır
