import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    name = 'veli';
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()],
        title: Text(name ?? ''),
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title', fillColor: Colors.green),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'Body', fillColor: Colors.green),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: 'UserId', fillColor: Colors.green),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));

                        _addItemToService(model);
                      }
                    },
              child: Text('Send'))
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
