import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;

  void fetchPostItems() async {
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts/');

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        //lenght null ise hic gostermesin demis olduk
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return Text("data");
        },
      ),
    );
  }
}
