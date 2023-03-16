import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        //sadece bos olunca gelen uyari mesajini gondermedende cikmasini sagladik
        //'bu alan bos gecilemez'
        autovalidateMode: AutovalidateMode.always,
        //formfieldlardaki herhangi bir degisiklikte tetiklenir
        //her harf yazilisinda vs
        onChanged: () {
          print("a");
        },
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            //secmeli form secenekleri gerekirse dropdown kullan
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text('data'), value: 'v'),
                DropdownMenuItem(child: Text('data'), value: 'v1'),
                DropdownMenuItem(child: Text('data'), value: 'v2')
              ],
              onChanged: (value) {},
            ),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('okey');
                  }
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bos gecilemez';
}
