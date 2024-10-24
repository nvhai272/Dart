import 'dart:convert';
import 'dart:io';
import 'Employee.dart';

void main() {
  FulltimeEmployee fulltime = FulltimeEmployee();
  ParttimeEmployee parttime = ParttimeEmployee();
  Employee employee = Employee();
  // String mapJSON =
  //     '{"id": 1, "name": "Hai", "companyName":"hn"}';

  while (true) {
    print('Menu:\n'
        '1. InputInfo\n'
        '2. DisplayInfo\n'
        '3. Import Info JSON\n'
        '4. Print JSON\n'
        '5. Exit\n'
        'Choice: ');
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        fulltime.inputInfo();
        parttime.inputInfo();
        break;
      case 2:
        fulltime.showInfo();
        parttime.showInfo();
        break;
      case 3:
        importInfoJson(employee);
        break;
      case 4:
        printJson(employee);
        break;
      case 5:
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void printJson(Employee employee) {
  // JSON
  print(employee.toJson()); // map
}

void importInfoJson(Employee e) {
  var map = inputJS();
  print("Map - $map");
  print("JSON - ${jsonEncode(map)}");

  // Employee
  // e = Employee.fromJson(map);
  e.id = map['id'];
  e.name = map['name'];
  e.companyName = map['companyName'];
  e.showInfo();
}

Map<String, dynamic> inputJS() {
  while (true) {
    try {
      print('Enter string JSON:');
      String jsonString = stdin.readLineSync()!;
      //String mapJSON = '{"id": 1, "name": "Hai", "companyName":"hn"}';

      Map<String, dynamic> map = jsonDecode(jsonString);
      return map;
    } catch (e) {
      print('Invalid JSON. Please try again.');
      continue;
    }
  }
}
