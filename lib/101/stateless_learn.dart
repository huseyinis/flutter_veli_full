import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(
            text: 'Veli',
          ),
          TitleTextWidget(text: 'Veli2'),
          _emptyBox(),
          TitleTextWidget(text: 'Veli3'),
          _emptyBox(),
          TitleTextWidget(text: 'Veli4'),
          _CustomContainerWidget(),
          _emptyBox(),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10);
}

class _CustomContainerWidget extends StatelessWidget {
  // '_' kullanımı bu sınıfın bu dosyaya ozgu oldugunu gosterır private yapar
  const _CustomContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      color: Colors.red,
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
