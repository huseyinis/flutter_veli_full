// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFoodButton(
                  onPressed: () {},
                  title: title,
                ),
              ),
            )),
            SizedBox(height: 100),
            CustomFoodButton(
              onPressed: () {},
              title: title,
            ),
          ],
        ));
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}

//widget dısarı cıkarmak ıle coer component yapmak aynı sey degıl
//core component yaparken dıkkat etmen gereken sey primitive olmalı
//ve durumlardan etkılenmemelı yanı ıkı farklı yerde kullanırken bır tanesınde bır ozellıgı
//degıstırdıgınde dıger butonun patlamasın
class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  //orrtak bır buton tasarımından yola cıktıgımız ıcın
  //her buton farklı ıslevlere sahıp olacagı ıcın callback degısken tanımladık
  //butonun ne ıs yapacagını dısardan verebılmek ıcın
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: redColor, shape: StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
