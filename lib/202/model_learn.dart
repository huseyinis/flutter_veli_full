// ignore_for_file: public_member_api_docs, sort_constructors_first
//herhangi bir degeri initialize etmeden veremeyiz dart bunu engeller
// alti kirmizi kalir bunun icin bir kac farkli yol var
class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

//ustteki ornekten farki postmodel4 te named parametre alir
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;
  //enkapsulation sayesinde bu modelin propertylerine erisebiliriz yoksa gorunmezler
  int get userId => _userId;

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
  //{
  //bu sekilde yazinca hata verdi sebebini tam soylemedi ustteki sekilde yazinca hata vermedi
  // int _userId = userId;
  // int _id = id;
  // String _title = title;
  // String _body = body;
  //}
}

class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel8 {
  //netten veri cektigimiz durumlarda vs en dogru kullanim dedi
  //netten veri cekiyosak her zaman veride sikinti olup null gelme ihtimali olabilir
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
//nullable seklinde degisken kullandigimiz icin constructorda named parametre yaptigimizda required koymamizi istemez
  PostModel8({this.userId, this.id, this.title, this.body});

//bunu olusturmak icin ustteki degiskenleri fare ile secip sari ampule tiklayinca generate copywithe tikladik kisa yol boyle
  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

class PostModel9 {
  //netten veri cektigimiz durumlarda vs en dogru kullanim dedi
  //netten veri cekiyosak her zaman veride sikinti olup null gelme ihtimali olabilir
  final int? userId;
  final int? id;
  final String? title;
  String?
      body; //diyelimki bir sebepten dolayi bu final degil o zaman bu degiskene veri esitlemek icin nullcheck yapmamiz lazim
//nullable seklinde degisken kullandigimiz icin constructorda named parametre yaptigimizda required koymamizi istemez
  PostModel9({this.userId, this.id, this.title, this.body});

  //null check
  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
    //nerdeyse hicbir zaman ! ile yapma bunu yukaridaki gibi nullcheck yap dogrusu yukaridaki
    data!.length;
  }

//bunu olusturmak icin ustteki degiskenleri fare ile secip sari ampule tiklayinca generate copywithe tikladik kisa yol boyle
  PostModel9 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel9(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
