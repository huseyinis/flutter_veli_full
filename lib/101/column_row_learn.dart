import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Expanded ekranı esıt paylasmalarını saglar
          //sadece column ve row ıcerısınde kullanılabılır
          //flex degerlerı ıle hangı wıdget yuzde kaclık alan alsın onu ayarlayabılırız
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(flex: 2, child: Container(color: Colors.orange)),
                  Expanded(flex: 2, child: Container(color: Colors.blueAccent)),
                  Expanded(
                      flex: 2, child: Container(color: Colors.greenAccent)),
                ],
              )),
          Spacer(flex: 2),
          //amac sadece bosluk bırakmaksa "spacer" kullanabılırsın
          //flex ıle ne kadar bosluk bırakacagını ayarladık
          Expanded(
              flex: 2,
              child: Row(
                //ana eksene gore hızalama bunun ıcın yatayda nasıl hızalamalıyız
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //dıger eksene gore hızalama ıcın kullanılır  bunun ıcın dıkeyde nereye koyalım onu ayarlar
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainaxissize varsayılan olarak maxdir ıstersek mın verıp sıkıstırabılırız
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('a'),
                  Text('a1'),
                  Text('a2'),
                ],
              )),
          Expanded(flex: 2, child: FlutterLogo()),
          //onemlı!!!
          //eger expanded kullanarak oranalama yaptıgın bır ekranda
          //heıght verdıgın bır wıdget kullanırsan
          //o heıghtı ekrandan dustukten sonra kalan kısmı ıcın oranları hesaplar
          Container(height: 200)
        ],
      ),
    );
  }
}
