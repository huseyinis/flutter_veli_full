import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          //alt alta cokca komponentin varsa
          //bır ust dalda ver paddingi tek tek ugrasma
          //yukarda Column widgetında verdıgımız ıcın altta vermemıze gerek kalmaz.
          children: [
            Padding(
              padding: const EdgeInsets.all(10), //tum kenarlardan bosluk verme
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20), //yatay yada dıkey yonde vermek ıstersek
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              //sag-sol-ust-alt yonlerde tek tek paddıng vermeye yarıyor
              padding: ProjectPadding.pagePaddingRightOnly +
                  ProjectPadding.pagePaddingVertical,
              //"+" işareti ile iki farklı edgeinsets degerını bırlıkte kullanabılırız
              child: Text('Ali'),
            ),
          ],
        ),
      ),
    );
  }
}

//her wıdgetı paddıngle sarcam dıye manyak olma
//kendı ıcerısınde paddıng komponentı olan wıdgetlarda kendı ıcerısınden paddıng ver
//mesela container wıdgetın ıcerısınde kendı paddıngı var
class ProjectPadding {
  //sayfa tasarımında padding degerlerı elle vermek yerıne
  //classta topla ve her ekranda farklı paddingler kullanma
  //ortak paddınglerı kullan sayfa tasarımların tutarlı olsun
  static EdgeInsets pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  //veri tipini vermezsek kendısı anlar vermek zorunda degılız ya da "var" kullanabılırız
  static const pagePaddingRightOnly = EdgeInsets.symmetric(vertical: 10);
}
