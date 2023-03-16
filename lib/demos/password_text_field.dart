import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obsucureText = '#';
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,

      //password ıslemlerınde obsocuretext kullanılırsa yazılan text gorunmuyor
      // sıfre gırme ıslemlerı ıcın oldukca ıyı
      obscureText: _isSecure,
      //gızlerken hangı karakter kullanılsın onu ayarlamamızı saglar
      obscuringCharacter: _obsucureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Password',
        suffix: _onVisibityIcon(),
      ),
    );
  }

  IconButton _onVisibityIcon() {
    return IconButton(
        onPressed: () {
          _changeLoading();
        },
        icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off));
  }
}
