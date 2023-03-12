import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //arkası opak yazı sekllınde olan button
          TextButton(
            onPressed: () {},
            child: Text('Save', style: Theme.of(context).textTheme.subtitle1),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.white;
              }),
            ),
          ),
          //bır kutu ıcerısınde olan buton
          ElevatedButton(
            onPressed: () {},
            child: Text('data'),
          ),
          //Icon seklınde olan button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.abc_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              //servise istek at
              //sayfanın rengını duzenle vs
              //ne yapılmasını ıstıyorsan butonla burada belırtıyosun
            },
            child: Icon(Icons.add),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: CircleBorder(), //şeklini değiştirdik
              padding: EdgeInsets.all(10),
            ),
            onPressed: () {},
            child: Text('data'),
          ),
          //.icon seklınde kullanım ornegı dıgerlkerınde de var
          //icon ve yazı yanyana kullanabılmemızı saglıyor
          OutlinedButton.icon(
            icon: Icon(Icons.abc),
            label: Text('data'),
            onPressed: () {},
          ),
          //Inkwell bu kullanımın yanı sıra cıft tıklama yada daha farkklı
          //dokunmaları algılamasını ıstedıgımızde kullanabılecegımız bır wıdget
          InkWell(
            onTap: () {},
            child: Text(
                'Custom'), //buton etkısı vermek ıstersek ınkwell widgetı ıle sarmamız lazım
          ),
          Container(
            height: 200,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 40, right: 40),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Borders:
//CircleBorder(),RoundedRectangularBorder()