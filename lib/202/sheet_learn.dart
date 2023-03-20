import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.red,
                //bottomsheet acıldıgında arkada kalan yerler hangı renk olsun onu ayarlarız
                barrierColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                //isScrollControlled true verırsek sheet ekranı kaplar
                isScrollControlled: true,
                builder: (context) {
                  return _CustomSheet(backgroundColor: _backgroundColor);
                });
          },
          child: Icon(Icons.share),
        ));
  }
}

class _CustomSheet extends StatelessWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  })  : _backgroundColor = backgroundColor,
        super(key: key);

  final Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('data22'),
            Image.network('https://picsum.photos/200/300'),
            ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   //butona basıldıgında sayfayı kapatsın ondan sonra
                  //   //arkaplan rengı degıstırsın dıye
                  //   Navigator.of(context).pop();
                  //   _backgroundColor = Colors.green;
                  // });
                },
                child: Text('OK'))
          ],
        ),
      ),
    );
  }
}
