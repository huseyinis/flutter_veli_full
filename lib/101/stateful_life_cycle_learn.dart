// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //initstateden sonra calısır
    //ekran yenıden cızılecegı zaman bu cagrılır
    print('c');
  }

  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('b');
  }

  @override
  void dispose() {
    super.dispose();
    //sayfadan cıkıldıgı anda calısır
    //mesajı temızlemek bır stateyı temızlemek gıbı dusun
    //öldurme ıslemlerı
  }

  //Mesaj tekse yanına tek yoksa çift yaz

  @override
  void initState() {
    //ilk bu state calısır sonra ekran cızılmeye baslanır
    //bu yuzden buradakı degısıklıklerı setstate etmeye gerek yoktur

    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;

    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' Cift';
    } else {
      _message += ' Tek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_message),
        ),
        body: widget.message.length.isOdd
            ? TextButton(onPressed: (() {}), child: Text(_message))
            : ElevatedButton(onPressed: () {}, child: Text(_message)));
  }
}
