import 'package:flutter/material.dart';
import 'package:flutter_veli_full/101/image_learn.dart';
import 'package:flutter_veli_full/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;
  void _updatePagIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: (() {
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }),
            child: Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: (() {
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }),
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        //sayfaları kaydırılabılır sekılde yan yana yerlestırebılmeyı saglar

        onPageChanged: _updatePagIndex,
        padEnds: false,
        controller: _pageController, //sonrakı sayfanın bır kısmı hafıf gorunr
        children: [
          StackLearn(),
          Container(color: Colors.red),
          ImageLearn(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 1);
}
