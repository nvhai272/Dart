import 'dart:io';

class PhuongTrinhBacNhat {
  int? _a;
  int? _b;

  PhuongTrinhBacNhat({int? a, int? b}) {
    if (a != null) {
      this._a = a;
    }
    if (b != null) {
      this._b = b;
    }
  }

  int? get a => _a;

  set a(int? a) => _a = a;

  int? get b => _b;

  set b(int? b) => _b = b;

  PhuongTrinhBacNhat.fromJson(Map<String, dynamic> json) {
    _a = json['a'];
    _b = json['b'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a'] = this._a;
    data['b'] = this._b;
    return data;
  }

  @override
  String toString() {
    return 'a = $a, b = $b';
  }

  String giaiPhuongTrinh() {
    String msg = "";
    if (a == 0 && b != 0) {
      msg = 'vo nghiem';
    } else if (a == 0 && b == 0) {
      msg = 'vo so nghiem';
    } else if (b == 0) {
      msg = 'co nghiem X = 0';
    } else if (b != 0 && a != 0) {
      double x = (-b!) / a!;
      msg = 'co nghiem x = ${x}';
    }
    return msg;
  }

  void printKQ(int a, int b, String msg) {
    if (b < 0) {
      print('PT ${a}X - ${b.abs()} = 0. PT ${msg}');
    } else {
      print('PT ${a}X + ${b} = 0. PT ${msg}');
    }
  }
}

List<Map<String, int>> inputListJSON(List<Map<String, int>> listJSON) {
  int count = 0;
  while (true) {
    try {
      print('Enter data for cap so thu ${++count}:');
      print('Input a:');
      int a = int.parse(stdin.readLineSync()!);
      print('Input b:');
      int b = int.parse(stdin.readLineSync()!);
      Map<String, int> capSo = {"a": a, "b": b};
      listJSON.add(capSo);
      if (count == 3) break;
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
  return listJSON;
}

void main() {
  List<Map<String, int>> listJSON = [
    {"a": 0, "b": 2},
    {"a": 10, "b": 0},
    {"a": 10, "b": 2}
  ];
  //inputListJSON(listJSON);
  print('Danh sach cac cap so: $listJSON');

  List<PhuongTrinhBacNhat> listCapSo = listJSON.map((Map<String, int> capSo) {
    return PhuongTrinhBacNhat(a: capSo['a'], b: capSo['b']);
  }).toList();

  //List<PhuongTrinhBacNhat> listPTBN = listJSON.map((json)=> PhuongTrinhBacNhat.fromJson(json)).toList();

  listCapSo.toString();

  // listCapSo.forEach((PhuongTrinhBacNhat ptBN) => ptBN.printKQ(ptBN.a!, ptBN.b!, ptBN.g));

  listCapSo.map((PhuongTrinhBacNhat capSo) {
    print('Cap so : ${capSo.a}, ${capSo.b}');
    capSo.printKQ(capSo.a!, capSo.b!, capSo.giaiPhuongTrinh());

  }).toList();

  // listCapSo.forEach((PhuongTrinhBacNhat capSo) {
  //   capSo.printKQ(capSo.a!, capSo.b!, capSo.giaiPhuongTrinh());
  //
  // });
}
