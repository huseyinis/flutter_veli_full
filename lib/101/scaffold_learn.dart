import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold samples'),
      ),
      body: Text('Merhaba'),
      backgroundColor: Colors.red, //sayfanın arka plan rengı degıstırme
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      // butonun yerını belırlemek ıcın kullanılır
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer:
          Drawer(), //appbarda sol kısma acılır menu sımgesı ekler ve soldan acılan bır menu verır
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
        BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'b'),
      ]),
    );
  }
}
