import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/cache/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;

  late final SharedManager _manager;
  @override
  //initstate icerisinde await future seklinde kodlar yazilmaz cunku inistate beklemez
  //varsa boyle islem baska fonksiyonda yaz o fonksiyonu initstate icerisinden cagir
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  void _initialize() {
    _changeLaoding();
    _manager.init();
    _changeLaoding();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
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
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [_saveValueButton(), _removeValueButton()]),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        _changeLaoding();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeLaoding();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLaoding();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');
        await _manager.removeItem(SharedKeys.counter);
        _changeLaoding();
      },
      child: Icon(Icons.delete),
    );
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void _changeLaoding() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
