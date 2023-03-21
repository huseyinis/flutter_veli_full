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
        onPressed: () async {
          final response = await showDialog(
              context: context,
              builder: (context) {
                return _UpdateDialog(context);
              });
        },
      ),
      appBar: AppBar(),
    );
  }

  AlertDialog _UpdateDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Version update!'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('Update'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'))
      ],
    );
  }
}
