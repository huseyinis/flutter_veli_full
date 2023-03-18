import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends State<SharedLearn> {
  int _currentValue = 0;
  bool _isLoading = false;

  void _changeLaoding(params) {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      _currentValue = _value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('counter', _currentValue);
        },
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
    );
  }
}
