import 'package:flutter/material.dart';

import '../demos/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                //ıcon baslık yazı vs bunların hepsını ıcermıs oluyor lısttıle widgetı alttakılerde
                //ayrı ayrı wıdgetlar
                title: RandomImage(),
                // dense: true,---->komponentı olabıldıgınce sıkıstırmayı saglar onemlı
                subtitle: Text('how do you use your card'),
                leading: Icon(Icons.money), //leadıng sola bısey koymak ıcın
                trailing: Icon(Icons.chevron_right), //saga busey koymak ıcın
                onTap: () {}, //tıklanmasını ıstıyorsak bunu kullanırız
              ),
            ),
          )
        ],
      ),
    );
  }
}
