import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imagePath =
      'https://i.pinimg.com/originals/87/df/c4/87dfc4307ec9671201f234591609b87e.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
                height: 400,
                width: 300,
                child: PngImage(name: ImageItems().appleBookWithoutPath)),
            Image.network(
              _imagePath,
              //errorbuılder atarız eger netten resım cekerken gelmezse gosterılecek ımage hazırlamıs oluruz
              errorBuilder: (context, error, stackTrace) =>
                  PngImage(name: ImageItems().appleBookWithoutPath),
            )
          ],
        ));
  }
}

class ImageItems {
  final String appleWithBook = 'assets/applewithbooks.png';
  final String appleBook = 'assets/png/apple_school.jpg';
  final String appleBookWithoutPath = 'applewithbooks';
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/$name.png';
}
