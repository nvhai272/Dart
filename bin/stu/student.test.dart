import 'student.dart';
import 'dart:convert';
import 'menu.dart';

void main() {
  var sv = RawData();

  var list = sv.findAll();
  // lay danh sach cua RawData;

  // list.forEach((stu) {
  //   print('ID: ${stu.id}');
  //   print('Gender: ${stu.gender}');
  //   print('First name: ${stu.firstName}');
  //   print('Email: ${stu.email}');
  //   print('');
  // });

  // cach khac:
  // list.forEach(hienThi);

  print('In ra tung doi tuong Map va JSON :');
  list.forEach(covertMapObjAndJSONObj);

  // print('List of raw JSON: ');
  // var rawListInJson = jsonEncode(list);
  // print(rawListInJson);

  //decode la chuyen tu string ve obj hoac array
  //encode la nguoc lai
  // khi chuyen du lieu qua cac ngon ngu khac nhau hoac tu backend sang frontend
  // hoac luu du lieu duoi dang JSON

//  convertStringJSONToMap();

//  convertStringJSONToList();
}

void hienThi(Student stu) {
  print('ID: ${stu.id}');
  print('Gender: ${stu.gender}');
  print('First name: ${stu.firstName}');
  print('Email: ${stu.email}');
  print('');
}

void covertMapObjAndJSONObj(Student stu) {
  var map = stu.toJson();
  print('MapObj: $map');

print('------- Chuyen ve JSON tu Map Obj ------');

  var json = jsonEncode(map);
  print('JSON: $json');
}

void convertStringJSONToMap(){
  var rawJson = '{"id":"IP101","name":"iPhone 13 128GB","price":13990000.0,"imgUrl":"iphone-13-mini-hong-1.jpg"}';
  var json = jsonDecode(rawJson) as Map<String, dynamic>;

  print('Hien thi Map:');
  print(json);

  print('Attribute of Map:');
  print(json['id']);
  print(json['name']);
  print(json['price']);
}

void convertStringJSONToList(){
  var rawJson = '[{"id":"IP101","name":"iPhone 13 128GB","price":13990000.0,"imgUrl":"iphone-13-mini-hong-1.jpg"}]';
  var list = jsonDecode(rawJson) as List;

  print('Hien thi:');
  for(Map<String, dynamic> json in list ){
    print(json['id']);
    print(json['name']);
    print(json['price']);
    print('');
  }
  // print('Attribute of Map:');
  // print(json['id']);
  // print(json['name']);
  // print(json['price']);
}