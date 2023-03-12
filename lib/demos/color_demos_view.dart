// ignore_for_file: public_member_api_docs, sort_constructors_first
//bir ekran olacak
//3 buton olacak ve bunlara basınca renk degısımı olacak
//secılı olan buton selected ıcon olsun

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({
    Key? key,
    required this.initialColor,
  }) : super(key: key);

  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _ColorOnTap,
          items: [
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: 'Red'),
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: 'Yellow'),
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
          ],
        ));
  }

  void _ColorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}
