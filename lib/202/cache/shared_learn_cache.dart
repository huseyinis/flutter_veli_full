import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/cache/shared_manager.dart';
import 'package:flutter_veli_full/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;
  @override
  //initstate icerisinde await future seklinde kodlar yazilmaz cunku inistate beklemez
  //varsa boyle islem baska fonksiyonda yaz o fonksiyonu initstate icerisinden cagir
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  void _initialize() {
    changeLaoding();
    _manager.init();
    changeLaoding();
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
        actions: [_loding(context)],
      ),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [_saveValueButton(), _removeValueButton()]),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loding(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        changeLaoding();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLaoding();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLaoding();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');
        _manager.removeItem(SharedKeys.counter);
        changeLaoding();
      },
      child: Icon(Icons.delete),
    );
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('vb', '10', 'vb10.dev'),
      User('vb2', '102', 'vb10.dev'),
      User('vb3', '103', 'vb10.dev'),
    ];
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLaoding() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
