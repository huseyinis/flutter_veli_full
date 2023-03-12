import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  @override
  late final List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return _CategoryCard(
            model: _items[index],
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().padingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                _model.imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_model.title),
                    Text('${_model.price} eth'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;
  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImages.imagaeCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imagaeCollection, title: 'Abstract Art2', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imagaeCollection, title: 'Abstract Art3', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imagaeCollection, title: 'Abstract Art4', price: 3.4),
    ];
  }
}

class PaddingUtility {
  //paddingleri bu sekilde ayri class seklinde tutarak
  //temiz kod yazmak onemli
  final padingBottom = EdgeInsets.only(bottom: 20);
}

class ProjectImages {
  static const imagaeCollection = 'assets/png/image_collection.png';
}
