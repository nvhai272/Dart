import 'dart:io';

class Num {
  late double _a;
  late double _b;

  double get a => _a;

  set a(double value) {
    _a = value;
  }

  double get b => _b;

  set b(double value) {
    _b = value;
  }

  Num(this._a, this._b);

  String giaiPhuongTrinh() {
    String msg = "";
    if (a == 0 && b != 0) {
      msg = 'vo nghiem';
    } else if (a == 0 && b == 0) {
      msg = 'vo so nghiem';
    } else if (b == 0) {
      msg = 'co nghiem X = 0';
    } else if(b != 0 && a!= 0){
      double x = -b / a;
      msg = 'co nghiem x = ${x}';
    }
    return msg;
  }

  void printKQ(double a, double b, String msg) {
    print('PT ${a}X + ${b} = 0. PT ${msg}');
  }
}

void main() {
  print('Giai phuong trinh bac nhat aX + b = 0');
  // while (true) {
  //   Num? n = inputNumber();
  //   if (n != null) {
  //     var kq = n.giaiPhuongTrinh();
  //
  //     printKQ(n.a, n.b, kq);
  //     break;
  //   }
  // }

  Num n = inputNumberUsingWhileTrue();
  var kq = n.giaiPhuongTrinh();

  n.printKQ(n.a, n.b, kq );
}

Num? inputNumber() {
  try {
    print('Nhap a =');
    double a = double.parse(stdin.readLineSync()!);

    print('Nhap b =');
    double b = double.parse(stdin.readLineSync()!);
    return Num(a, b);
  } catch (e) {
    print('Loi roi, nhap lai number di');
    return null;
  }
}

Num inputNumberUsingWhileTrue() {
  while (true) {
    try {
      print('Nhap a =');
      double a = double.parse(stdin.readLineSync()!);

      print('Nhap b =');
      double b = double.parse(stdin.readLineSync()!);
      return Num(a, b);
    } catch (e) {
      print('Loi roi, nhap lai number di');
    }
  }
}
