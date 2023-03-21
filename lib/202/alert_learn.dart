import 'dart:html';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Version update!'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Update'),
                    )
                  ],
                );
              });
        },
      ),
      appBar: AppBar(),
    );
  }
}
