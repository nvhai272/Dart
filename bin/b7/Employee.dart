import 'dart:io';

import 'IAction.dart';

class Employee implements IAction {
  late int _id;
  late String _name;
  late String _companyName;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get companyName => _companyName;

  set companyName(String value) {
    _companyName = value;
  }

  Employee();

  Employee.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _companyName = json['companyName'];
  }

  Employee._(int id, String name, String companyName);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['companyName'] = this._companyName;
    return data;
  }

  @override
  void inputInfo() {
    while (true) {
      try {
        print('Enter employee ID: ');
         id = int.parse(stdin.readLineSync()!);
        print('Enter employee name: ');
         name = stdin.readLineSync()!;
        print('Enter company name: ');
         companyName = stdin.readLineSync()!;
        break;
      } catch (e) {
        print('Invalid input. Please enter again.');
      }
    }
  }

  @override
  void showInfo() {
    print('Employee ID: $id');
    print('Name: $name');
    print('Company Name: $companyName');
  }
}

class ParttimeEmployee extends Employee {
  late int _shift;

  int get shift => _shift;

  set shift(int value) {
    _shift = value;
  }

  ParttimeEmployee();

  @override
  void inputInfo() {
    while (true) {
      try {
        super.inputInfo();
        print('Enter shift (1-5): ');
         shift = int.parse(stdin.readLineSync()!);
        break;
      } catch (e) {
        print('Invalid input. Please enter again');
      }
    }
  }

  @override
  void showInfo() {
    super.showInfo();
    print('Shift: $shift');
  }
}

class FulltimeEmployee extends Employee {
  late String _position;

  String get position => _position;

  set position(String value) {
    _position = value;
  }

  FulltimeEmployee();

  @override
  void inputInfo() {
    while (true) {
      try {
        super.inputInfo();
        print('Enter position: ');
         position = stdin.readLineSync()!;
        break;
      } catch (e) {
        print('Invalid input. Please enter again.');
      }
    }
  }

  @override
  void showInfo() {
    super.showInfo();
    print('Position: $position');
  }
}
