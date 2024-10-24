import 'dart:io';
import 'dart:math';
import '../b1/ptb1.dart';

class Num2 {
  late double _a;
  late double _b;
  late double _c;

  double get c => _c;

  set c(double value) {
    _c = value;
  }

  double get a => _a;

  set a(double value) {
    _a = value;
  }

  double get b => _b;

  set b(double value) {
    _b = value;
  }

  Num2(this._a, this._b, this._c);

  String giaiPhuongTrinh() {
    String msg = "";
    if (a != 0) {
      double delta = b * b - 4 * (a * c);
      if (delta > 0) {
        double x1 = (-b + sqrt(delta)) / (2 * a);
        double x2 = (-b - sqrt(delta)) / (2 * a);

        msg = 'co 2 nghiem x1 = ${x1} va x2 = ${x2} ';
      }
      else if (delta == 0) {
        double x = -b / (2 * a);
        msg = 'co nghiem kep x1,x2 = $x';
      }
      else {
        msg = 'Phương trình vô nghiệm';
      }
    } else {
      Num ptb1 = new Num(b, c);
      msg = ptb1.giaiPhuongTrinh();
    }
    return msg;
  }
}

void main() {
  print('Giai phuong trinh bac 2: aX^2 + bX + c = 0');
  Num2 n = inputNumber();

  var kq = n.giaiPhuongTrinh();

  printKQ(n.a, n.b, n.c, kq);
}

void printKQ(double a, double b, double c, String msg) {
  String dau1 = "+";
  String dau2 = "+";
  if(b<0){
    dau1 ="-";
    b = b.abs();
  }
  if(c<0){
    dau2 ="-";
    c = c.abs();
  }


  String formatNumber(double number) {
    return (number % 1 == 0) ? number.toInt().toString() : number.toString();
  }

  print('PT ${formatNumber(a)}X^2 $dau1 ${formatNumber(b)}X $dau2 ${formatNumber(c)} = 0. PT $msg');
}

Num2 inputNumber() {
  while (true) {
    try {
      print('Nhap a =');
      double a = double.parse(stdin.readLineSync()!);

      print('Nhap b =');
      double b = double.parse(stdin.readLineSync()!);

      print('Nhap c =');
      double c = double.parse(stdin.readLineSync()!);

      return Num2(a, b, c);
    } catch (e) {
      print('Loi roi, nhap lai number di');
    }
  }
}
