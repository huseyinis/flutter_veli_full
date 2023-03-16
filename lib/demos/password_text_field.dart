import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});
  final _obsucureText = '#';

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,

      //password ıslemlerınde obsocuretext kullanılırsa yazılan text gorunmuyor
      // sıfre gırme ıslemlerı ıcın oldukca ıyı
      obscureText: true,
      //gızlerken hangı karakter kullanılsın onu ayarlamamızı saglar
      obscuringCharacter: _obsucureText,
      decoration: InputDecoration(border: UnderlineInputBorder(), hintText: 'Password'),
    );
  }
}
