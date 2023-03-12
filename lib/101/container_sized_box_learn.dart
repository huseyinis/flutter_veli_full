import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Text('a' * 500),
          ),
          SizedBox.shrink(), //bos bir alan bırakmak ıcın kullanılır
          SizedBox.square(
            //kare seklınde 50 pixsellik bır kutu olusturduk
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            constraints: BoxConstraints(
              //boyut sınırlandırma
              maxWidth: 200,
              minWidth: 10,
              minHeight: 10,
              maxHeight: 200,
            ),
            child: Text(
              'aa' * 100,
              maxLines: 2,
            ),
            padding: EdgeInsets.all(10), //içerdekine bosluk atmaya yarar
            margin: EdgeInsets.all(10), //dısardakıne bosluk atmaya yarar
            decoration: ProjectUtility.boxDecoration,
          )
        ],
      ),
    );
  }
}

//altta her seferınde yukardakı gıbı tek tek yazmayıp class olusturup
// ordan bu kodları cekmek seklındekı
// kullanımı ıceren ıkı farklı yontem kullanımını goruyoruz.
class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10), //köşeleri ovallestirmeyi saglıyor
    //color: Colors.red, //boxdecoration kullanıyorsak rengı burada vermek zorundayız
    gradient: LinearGradient(
        colors: [Colors.red, Colors.blueAccent]), //ikili renk gecıslerı ıcın
    boxShadow: [
      BoxShadow(
          //kutu arkasına golge ile tasarım
          color: Colors.orange,
          offset: Offset(0.1, 1),
          blurRadius: 12),
    ],
    //shape: BoxShape.circle,//seklini degıstırdık
    border: Border.all(
        width: 10,
        color: Colors
            .greenAccent), //dış sınırı özelleştirmek için kenarları ozellestırmek ıcın
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius:
              BorderRadius.circular(10), //köşeleri ovallestirmeyi saglıyor
          //color: Colors.red, //boxdecoration kullanıyorsak rengı burada vermek zorundayız
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.blueAccent
          ]), //ikili renk gecıslerı ıcın
          boxShadow: [
            BoxShadow(
                //kutu arkasına golge ile tasarım
                color: Colors.orange,
                offset: Offset(0.1, 1),
                blurRadius: 12),
          ],
          //shape: BoxShape.circle,//seklini degıstırdık
          border: Border.all(
              width: 10,
              color: Colors
                  .greenAccent), //dış sınırı özelleştirmek için kenarları ozellestırmek ıcın
        );
}
