import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final ProjectKeys keys = ProjectKeys();
  final String name = 'Veli';
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('Welcome $name ${name.length}'),
              maxLines: 2, //en fazla satır sayısı
              overflow: TextOverflow.ellipsis, //satır sonuna 3 nokta atma
              textAlign: TextAlign.right, //texti saga sola hizalamak
              style: TextStyle(
                wordSpacing: 2, //kelime arasına bosluk bırakma
                decoration: TextDecoration.underline, //text altına çizgi
                fontStyle: FontStyle.italic, //font stili verme
                letterSpacing: 2, //harfler arasına bosluk bırakmak
                fontSize: 16, //font boyutu
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(('Hello $name ${name.length}'),
                maxLines: 2, //en fazla satır sayısı
                overflow: TextOverflow.ellipsis, //satır sonuna 3 nokta atma
                textAlign: TextAlign.right, //texti saga sola hizalamak
                style: ProjectStyles.welcomeStyle),
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2, //en fazla satır sayısı
              overflow: TextOverflow.ellipsis, //satır sonuna 3 nokta atma
              textAlign: TextAlign.right, //texti saga sola hizalamak
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  //mevcut flutter temalarından cektık copywith
                  color: ProjectColors
                      .welcomeColor //ile su ozellıklerı farklı olsun dıye özelleştirdik
                  ),
            ),
            Text(userName ??
                ''), //NULL CHECK tanımlarken ? ile bos gelebılır dedıgımız degıskenlerde sakın ! ile force etme
            //nul check yap bu sekılde
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2, //kelime arasına bosluk bırakma
    decoration: TextDecoration.underline, //text altına çizgi
    fontStyle: FontStyle.italic, //font stili verme
    letterSpacing: 2, //harfler arasına bosluk bırakmak
    fontSize: 16, //font boyutu
    color: Colors.red,
    fontWeight: FontWeight.w600,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
