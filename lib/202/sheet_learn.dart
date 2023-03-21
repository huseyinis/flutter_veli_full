import 'package:flutter/material.dart';
import 'package:flutter_veli_full/101/list_view_learn.dart';
import 'package:flutter_veli_full/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(),
        body: Center(
          child: TextButton(
            onPressed: () {
              showCustomSheet(context, ListViewLearn());
            },
            child: Text('Show'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
                context: context,

                //bottomsheet acıldıgında arkada kalan yerler hangı renk olsun onu ayarlarız
                // barrierColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                //isScrollControlled true verırsek sheet ekranı kaplar
                isScrollControlled: true,
                builder: (context) {
                  return _CustomSheet(backgroundColor: _backgroundColor);
                });
            if (result is bool) {
              setState(() {
                _backgroundColor = Colors.cyan;
              });
            }
          },
          child: Icon(Icons.share),
        ));
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //cızgı attık dıvıder ıle
            SizedBox(
              height: 24,
              child: Stack(alignment: Alignment.topCenter, children: [
                Divider(
                  color: Colors.black26,
                  thickness: 3,
                  //sol taraftan cızgıyı kısallttık
                  indent: MediaQuery.of(context).size.width * 0.45,
                  //sag taraftan cızgıyı kısalttık
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.close),
                    alignment: Alignment.center,
                  ),
                )
              ]),
            ),
            Text('data22'),
            Image.network('https://picsum.photos/200/300'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //butona basıldıgında sayfayı kapatsın ondan sonra
                    //arkaplan rengı degıstırsın dıye
                    _backgroundColor = Colors.amber;
                    Navigator.of(context).pop<bool>(true);
                  });
                },
                child: Text('OK'))
          ],
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    showModalBottomSheet(
        context: context,
        //bottomsheet acıldıgında arkada kalan yerler hangı renk olsun onu ayarlarız
        // barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        //isScrollControlled true verırsek sheet ekranı kaplar
        // isScrollControlled: true,
        builder: (context) {
          return _CustomMainSheet(
            child: child,
          );
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  _CustomMainSheet({super.key, required this.child});
  final Widget child;

  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //cızgı attık dıvıder ıle
            _BaseHeaderSheet(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _BaseHeaderSheet extends StatelessWidget {
  const _BaseHeaderSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(alignment: Alignment.topCenter, children: [
        Divider(
          color: Colors.black26,
          thickness: 3,
          //sol taraftan cızgıyı kısallttık
          indent: MediaQuery.of(context).size.width * 0.45,
          //sag taraftan cızgıyı kısalttık
          endIndent: MediaQuery.of(context).size.width * 0.45,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.close),
            alignment: Alignment.center,
          ),
        )
      ]),
    );
  }
}
