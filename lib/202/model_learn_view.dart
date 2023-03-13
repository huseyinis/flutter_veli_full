import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  //datayi sonradan degistirmek istersek final kullanamayiz bu yuzden 'var' yada degiskeni giriyoruz
  //final user9 = PostModel8(body: 'a');
  PostModel8 user9 = PostModel8(body: 'a');
  @override
  void initState() {
    super.initState();
    final user1 = PostModel()
      ..userId = 1
      ..body = 'vb';
    user1.body = 'hello';
    //.. seklinde kullanarakta degisken atanabilir user1.body ile ayni sey

    final user2 = PostModel2(1, 2, 'b', 'a');
    user2.body = 'a';
    //boyle yapabildik cunku bu modelde final isaretlenmemis bu degerler degerlerini aliyor ve update edilebiliyor

    final user3 = PostModel3(1, 3, 'a', 'b');
    //user3.body = 'a'; --->hata verir
    //cunku PostModel3 te final propertysi kullandik degerini alir daha sonra degistirilemez degistirmeyi denersek hata aliriz
    final user4 = PostModel4(userId: 1, id: 3, title: 'a', body: 'b');
    //user4.body = 'a'; --->hata verir
    //bunda da PostModel4 final seklinde olustugu icin degerleri sonradan guncelleyemeyiz
    //verileri yerelden cekiyosak model4 falan iyidir dedi gecistirdi

    final user5 = PostModel5(userId: 1, id: 3, title: 'title', body: 'body');
    //enkapsulation sayesinde bu modelin propertylerine erisebiliriz yoksa gorunmezler
    user5.userId;
    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');
    //postmodel5 ile benzer degiskenlere dogrudan erisemiyoruz safed olmasi acisindan bunlarda onemli
    final user7 = PostModel7();
    //burda da private yaptigimiz icin erisemiyoruz eger deger vermezsek
    //varsayilan deger girdigimiz icin onlari alir

    //Serviceden data cekiyorsak en mantiklisi Model8
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //modele ekleme yaparken yeni bir model ornegi olusturup
            //bu modele istedigimiz degiskeni girmistik(final degisken oldugu icin) ama
            //orda da soyle bir sorun oldu bir degisken girdigimiz zaman onceki instancenin degerleri kayboluyordu
            //copywith yapisiyla onceki degerleri kaybetmeden yeni deger ekledik postmodel8 i incele
            user9 = user9.copyWith(title: 'vb');
            //postmodel8 ile yapitigimiz icin cikmadi alttaki sekilde ben ayri ayri modelde
            //dursun diye postmodel9 yazip girdim model_learn classinda
            //user9.updateBody('veli');
          });
        },
      ),
      appBar: AppBar(
        //nullable model oldugu icin dogrudan verince hata veriyor ya veri gelmezse diye kiziyor bize o yuzden
        //alttaki gibi kullandik ??ile olumsuz durumda kullanasi gereken texti verdik
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}

//yukarida bu ornegi degistirerek ekleme yapti
//burada final ne ise yarar nasil final olan degiskenleri yonetiriz guzel bir ornek
//  Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //burada yeni bir model olusturarak degistirebiliyoruz cunku model icerisindeki datalarda final oldugu icin icini degistiremeyiz
//           setState(() {
//             user9 = PostModel8(title: 'On Pressed');
//           });
//         },
//       ),
//       appBar: AppBar(
//         //nullable model oldugu icin dogrudan verince hata veriyor ya veri gelmezse diye kiziyor bize o yuzden
//         //alttaki gibi kullandik ??ile olumsuz durumda kullanasi gereken texti verdik
//         title: Text(user9.title ?? 'Not has any data'),
//       ),
//     );
//   }
