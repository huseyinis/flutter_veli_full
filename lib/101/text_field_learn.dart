import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_veli_full/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedController(currentLength);
            },
            //klavyede otomatık @ isareti cıkar
            //o textfielda tıkladıgımızda ne tip bır klavye cıkar onu tanımlıyoruz
            keyboardType: TextInputType.emailAddress,
            //neyle tamamlayacagını verırız klavyede kelıme cıkmasına yardımcı olur sanırım
            inputFormatters: [
              //eski ve yenı gırdılerı karsılastırmamıza vs yarar arastır!
              TextProjectInputFormatter()._formatter
            ],
            //textınputactıon sayesınde next tusu olur keyboardda ve
            // ona tıklayınca sonrakı textfıelda gecer
            textInputAction: TextInputAction.next,
            autofillHints: [AutofillHints.email],
            focusNode: focusNodeTextFieldOne,
            decoration: _InputDecorator().emailInput,
          ),
          TextFormField(
            focusNode: focusNodeTextFieldTwo,
            minLines: 2,
            maxLines: 4,
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedController(int? currentLength) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: Colors.green,
      height: 15,
      width: 10.0 * (currentLength ?? 0),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == 'a') {
      return oldValue;
    } else {
      return oldValue;
    }
  });
}

class _InputDecorator {
  final emailInput = InputDecoration(
    //prefixicon textın soluna icon atmaya yarar
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    //labeltext ile textfieldın uzerıne ıstedıgımız etıketı yazabılırız
    labelText: LanguageItems.mailTitle,
    //fill color background vermeye yarar
    // fillColor: Colors.white,
    // filled: true
  );
}
