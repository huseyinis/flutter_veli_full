import 'package:flutter/material.dart';
import 'package:flutter_veli_full/101/icon_learn.dart';
import 'package:flutter_veli_full/101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            shape: CircularNotchedRectangle(),
            child: _myTab(tabController: _tabController),
          ),
          appBar: AppBar(),
          body: _tabbarView(tabController: _tabController),
        ));
  }
}

class _myTab extends StatelessWidget {
  const _myTab({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      //istersek kendi kodumuzu yazabiliriz tiklanildigi an icin
      onTap: (value) {},
      //secili olmayan sayfanin etiketinin rengini verir
      //unselectedLabelColor: Colors.green,
      //page1-page2 yazisinin rengini degistirmeyi sagliyor
      // labelColor: Colors.red,
      //saga sola gecis animasyonunu hissettiren ince cizginin rengi
      //indicatorColor: Colors.white,
      controller: _tabController,
      tabs: _MyTabViews.values
          .map((e) => Tab(
                text: '${e.name}',
              ))
          .toList(),
    );
  }
}

class _tabbarView extends StatelessWidget {
  const _tabbarView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      //basili tutarak saga sola gecmesini kapatmak istersek alttaki property kullanilir
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        ImageLearn(),
        IconLearnView(),
        IconLearnView(),
        IconLearnView(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
//23.20 sure
