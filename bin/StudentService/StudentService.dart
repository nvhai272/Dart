// void main(){
//   print('11111');
//
//   // ham bat dong bo return Future<R> nen can su dung => then de xu li Future
//   doIt().then((value) => print('Da nhan: $value'));
//   // khong cho ham doit thuc thi xong ma chay cac dong tiep theo luoon, khi nao doIt xong thi xu li tiep
//   print('333333');
// }

// Future<void> main() async {

// async vs await cho xu li ham bdb xong moi chay tiep
void main() async {
  print('11111');
  var rs = await doIt();

  print(rs);
  print('333333');
}

Future<String> doIt() {
  print('2222222');
  return Future.delayed(Duration(seconds: 2), () => "Ha Noi mua thu");
}
