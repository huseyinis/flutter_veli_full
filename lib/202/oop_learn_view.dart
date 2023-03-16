import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? download;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.DownloadItem(null);
        },
      ),
    );
  }
}
//dakıka 45.23