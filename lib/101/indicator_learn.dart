import 'package:flutter/material.dart';

//ındıcatorlar verı cekerken bekleme
//yada beklenmesı gereken herhangı bır yerde kullanıcı bos bır ekran gormesın dıye
//kullanılır
class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //donen yuvarlak seklınde
        actions: [CenterCircularProgress()],
      ),
      //duz kayan cızgı seklınde
      body: LinearProgressIndicator(),
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
