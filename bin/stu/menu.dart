import 'dart:io';
import 'student.dart';
import 'dart:convert';

void main() {
  List<Student> students = [];
  while (true) {
    print('Menu:');
    print('1. Convert raw JSON' +
        '\n2. Hiển thị thông tin' +
        '\n3. Hiển thị thông tin theo gender' +
        '\n4. Thoát');

    print('Chon chuc nang di:');
    int chooseMenu = int.parse(stdin.readLineSync()!);

    switch (chooseMenu) {
      case (1):
        students = convertStringJSON(RawData._students);
        print('da convert');
        break;
      case (2):
        if(students.isNotEmpty){
          int n = 0;
          students.forEach((stu) {
            print('Student ${n++}');
            print('ID: ${stu.id}');
            print('Gender: ${stu.gender}');
            print('First name: ${stu.firstName}');
            print('Email: ${stu.email}');
          });
        }
        else{
          print('Chua convert');
        }
        break;
      case (3):
        print('Nhap gioi tinh can tim:');
        String inputGender = stdin.readLineSync()!;

        var listFilter = students
            .where((student) => student.gender! == inputGender)
            .toList();

        if(listFilter.isNotEmpty){
          int n = 0;
          listFilter.forEach((stu) {
            print('Student ${n++}');
            print('Gender: ${stu.gender}');
            print('First name: ${stu.firstName}');
            print('Email: ${stu.email}');
          });
        }else{
          print('Thong tin tim kiem khong ton tai');
        }
        break;
      case (4):
        print('Thoat');
        return;

      default:
        print('Chuc nang khong hop le!');
    }
  }
}

List<Student> convertStringJSON(String list) {
  List<dynamic> allJson = jsonDecode(list) as List<dynamic>;
  return allJson.map((json) => Student.fromJson(json)).toList();
}

class RawData {
  static const String _students =
      '[{"id":1,"first_name":"Bealle","last_name":"Bohea","email":"bbohea0@nih.gov","gender":"Male"},{"id":2,"first_name":"Cal","last_name":"Sheircliffe","email":"csheircliffe1@soup.io","gender":"Male"},{"id":3,"first_name":"Ellette","last_name":"Bryett","email":"ebryett2@wsj.com","gender":"Female"},{"id":4,"first_name":"Sidoney","last_name":"McDermid","email":"smcdermid3@de.vu","gender":"Genderqueer"},{"id":5,"first_name":"Chuck","last_name":"Bissex","email":"cbissex4@who.int","gender":"Male"},{"id":6,"first_name":"Kane","last_name":"Antoons","email":"kantoons5@bravesites.com","gender":"Male"},{"id":7,"first_name":"Katinka","last_name":"Ramme","email":"kramme6@hc360.com","gender":"Female"},{"id":8,"first_name":"Laurella","last_name":"McMakin","email":"lmcmakin7@spiegel.de","gender":"Female"},{"id":9,"first_name":"Lucio","last_name":"Brindle","email":"lbrindle8@friendfeed.com","gender":"Male"},{"id":10,"first_name":"Stanislaus","last_name":"Carpenter","email":"scarpenter9@cyberchimps.com","gender":"Male"},{"id":11,"first_name":"Antons","last_name":"Bremond","email":"abremonda@walmart.com","gender":"Male"},{"id":12,"first_name":"Bone","last_name":"Maffeo","email":"bmaffeob@symantec.com","gender":"Male"},{"id":13,"first_name":"Fonsie","last_name":"Garrood","email":"fgarroodc@dyndns.org","gender":"Male"},{"id":14,"first_name":"Doralynn","last_name":"Gheeorghie","email":"dgheeorghied@cam.ac.uk","gender":"Female"},{"id":15,"first_name":"Clara","last_name":"Crumley","email":"ccrumleye@biglobe.ne.jp","gender":"Female"},{"id":16,"first_name":"Tallou","last_name":"Uzzell","email":"tuzzellf@phpbb.com","gender":"Female"},{"id":17,"first_name":"Kelby","last_name":"Berriman","email":"kberrimang@1und1.de","gender":"Male"},{"id":18,"first_name":"Dian","last_name":"Madgwick","email":"dmadgwickh@ed.gov","gender":"Female"},{"id":19,"first_name":"Faye","last_name":"Seint","email":"fseinti@wikia.com","gender":"Female"},{"id":20,"first_name":"Stormi","last_name":"Jaquemar","email":"sjaquemarj@comsenz.com","gender":"Female"},{"id":21,"first_name":"Ofella","last_name":"Pattison","email":"opattisonk@ihg.com","gender":"Genderqueer"},{"id":22,"first_name":"Janos","last_name":"Deakin","email":"jdeakinl@xinhuanet.com","gender":"Male"},{"id":23,"first_name":"Jarvis","last_name":"Spendley","email":"jspendleym@tripod.com","gender":"Male"},{"id":24,"first_name":"Leontine","last_name":"Tattam","email":"ltattamn@rediff.com","gender":"Genderfluid"},{"id":25,"first_name":"Rusty","last_name":"Pietruszewicz","email":"rpietruszewiczo@usa.gov","gender":"Male"},{"id":26,"first_name":"Eldon","last_name":"Rostern","email":"erosternp@nba.com","gender":"Male"},{"id":27,"first_name":"Dixie","last_name":"Featenby","email":"dfeatenbyq@miitbeian.gov.cn","gender":"Female"},{"id":28,"first_name":"Saxon","last_name":"Oldknowe","email":"soldknower@de.vu","gender":"Male"},{"id":29,"first_name":"Francis","last_name":"Northover","email":"fnorthovers@surveymonkey.com","gender":"Male"},{"id":30,"first_name":"Lorry","last_name":"Kilborn","email":"lkilbornt@pbs.org","gender":"Female"},{"id":31,"first_name":"Hanna","last_name":"Castletine","email":"hcastletineu@fc2.com","gender":"Female"},{"id":32,"first_name":"Lauree","last_name":"Barradell","email":"lbarradellv@vk.com","gender":"Female"},{"id":33,"first_name":"Karleen","last_name":"Maudsley","email":"kmaudsleyw@desdev.cn","gender":"Non-binary"},{"id":34,"first_name":"Guillermo","last_name":"Weal","email":"gwealx@loc.gov","gender":"Male"},{"id":35,"first_name":"Joela","last_name":"Ethington","email":"jethingtony@newyorker.com","gender":"Female"},{"id":36,"first_name":"Theodore","last_name":"Abrehart","email":"tabrehartz@gnu.org","gender":"Male"},{"id":37,"first_name":"Amil","last_name":"Bode","email":"abode10@wix.com","gender":"Female"},{"id":38,"first_name":"Julian","last_name":"Wharfe","email":"jwharfe11@netlog.com","gender":"Male"},{"id":39,"first_name":"Mozes","last_name":"Moloney","email":"mmoloney12@stanford.edu","gender":"Male"},{"id":40,"first_name":"Claudetta","last_name":"Trigwell","email":"ctrigwell13@nhs.uk","gender":"Agender"},{"id":41,"first_name":"Cariotta","last_name":"Dabels","email":"cdabels14@yelp.com","gender":"Female"},{"id":42,"first_name":"Vivien","last_name":"Duplain","email":"vduplain15@google.com.br","gender":"Agender"},{"id":43,"first_name":"Hanny","last_name":"Degli Antoni","email":"hdegliantoni16@disqus.com","gender":"Female"},{"id":44,"first_name":"Alfy","last_name":"Fortoun","email":"afortoun17@google.ca","gender":"Polygender"},{"id":45,"first_name":"Bran","last_name":"Mazella","email":"bmazella18@pcworld.com","gender":"Polygender"},{"id":46,"first_name":"Mara","last_name":"Moysey","email":"mmoysey19@fc2.com","gender":"Female"},{"id":47,"first_name":"Teresina","last_name":"Newlan","email":"tnewlan1a@cocolog-nifty.com","gender":"Female"},{"id":48,"first_name":"Creight","last_name":"Halm","email":"chalm1b@flickr.com","gender":"Male"},{"id":49,"first_name":"Rodrick","last_name":"Cottage","email":"rcottage1c@tuttocitta.it","gender":"Male"},{"id":50,"first_name":"Claudetta","last_name":"Lorand","email":"clorand1d@theatlantic.com","gender":"Female"},{"id":51,"first_name":"Cathi","last_name":"Aartsen","email":"caartsen1e@printfriendly.com","gender":"Female"},{"id":52,"first_name":"Kasey","last_name":"Enrique","email":"kenrique1f@ehow.com","gender":"Female"},{"id":53,"first_name":"Gino","last_name":"Letford","email":"gletford1g@state.gov","gender":"Male"},{"id":54,"first_name":"Chet","last_name":"Cohani","email":"ccohani1h@miitbeian.gov.cn","gender":"Male"},{"id":55,"first_name":"Margarette","last_name":"Corhard","email":"mcorhard1i@freewebs.com","gender":"Agender"},{"id":56,"first_name":"Carlen","last_name":"Giannazzi","email":"cgiannazzi1j@goodreads.com","gender":"Female"},{"id":57,"first_name":"Lionello","last_name":"Standidge","email":"lstandidge1k@wix.com","gender":"Male"},{"id":58,"first_name":"Jojo","last_name":"Letixier","email":"jletixier1l@wix.com","gender":"Female"},{"id":59,"first_name":"Grover","last_name":"Dickenson","email":"gdickenson1m@ed.gov","gender":"Male"},{"id":60,"first_name":"Bink","last_name":"Diggar","email":"bdiggar1n@sina.com.cn","gender":"Male"},{"id":61,"first_name":"Jamison","last_name":"Jouandet","email":"jjouandet1o@npr.org","gender":"Male"},{"id":62,"first_name":"Merv","last_name":"Mobberley","email":"mmobberley1p@paginegialle.it","gender":"Male"},{"id":63,"first_name":"Burk","last_name":"Seman","email":"bseman1q@jimdo.com","gender":"Male"},{"id":64,"first_name":"Jodee","last_name":"Blomfield","email":"jblomfield1r@buzzfeed.com","gender":"Female"},{"id":65,"first_name":"Cosme","last_name":"Faragher","email":"cfaragher1s@mtv.com","gender":"Male"},{"id":66,"first_name":"Ira","last_name":"Cumes","email":"icumes1t@mlb.com","gender":"Male"},{"id":67,"first_name":"Mari","last_name":"Caps","email":"mcaps1u@toplist.cz","gender":"Female"},{"id":68,"first_name":"Rowan","last_name":"Cuskery","email":"rcuskery1v@myspace.com","gender":"Male"},{"id":69,"first_name":"Paula","last_name":"Staneland","email":"pstaneland1w@ca.gov","gender":"Female"},{"id":70,"first_name":"Corinne","last_name":"Noice","email":"cnoice1x@weather.com","gender":"Female"},{"id":71,"first_name":"Neils","last_name":"Pobjoy","email":"npobjoy1y@senate.gov","gender":"Male"},{"id":72,"first_name":"Ryon","last_name":"Dicks","email":"rdicks1z@a8.net","gender":"Male"},{"id":73,"first_name":"Farr","last_name":"Kruger","email":"fkruger20@ameblo.jp","gender":"Male"},{"id":74,"first_name":"Frederik","last_name":"Scoles","email":"fscoles21@google.cn","gender":"Male"},{"id":75,"first_name":"Candie","last_name":"Briddock","email":"cbriddock22@google.com.br","gender":"Polygender"},{"id":76,"first_name":"Damara","last_name":"Matiewe","email":"dmatiewe23@surveymonkey.com","gender":"Female"},{"id":77,"first_name":"Derry","last_name":"Minney","email":"dminney24@clickbank.net","gender":"Male"},{"id":78,"first_name":"Gery","last_name":"Denekamp","email":"gdenekamp25@networkadvertising.org","gender":"Male"},{"id":79,"first_name":"Ethelbert","last_name":"Wooder","email":"ewooder26@bizjournals.com","gender":"Male"},{"id":80,"first_name":"Cassandry","last_name":"Briereton","email":"cbriereton27@linkedin.com","gender":"Female"},{"id":81,"first_name":"Jackie","last_name":"Kaming","email":"jkaming28@yale.edu","gender":"Male"},{"id":82,"first_name":"Martino","last_name":"Jacqueme","email":"mjacqueme29@pcworld.com","gender":"Male"},{"id":83,"first_name":"Janos","last_name":"Lee","email":"jlee2a@miitbeian.gov.cn","gender":"Male"},{"id":84,"first_name":"Ripley","last_name":"Shawyer","email":"rshawyer2b@dagondesign.com","gender":"Male"},{"id":85,"first_name":"Vite","last_name":"Sier","email":"vsier2c@state.tx.us","gender":"Male"},{"id":86,"first_name":"Roxy","last_name":"Victory","email":"rvictory2d@jimdo.com","gender":"Female"},{"id":87,"first_name":"Twila","last_name":"Kobpac","email":"tkobpac2e@washington.edu","gender":"Female"},{"id":88,"first_name":"Thadeus","last_name":"Paulucci","email":"tpaulucci2f@acquirethisname.com","gender":"Genderfluid"},{"id":89,"first_name":"Mathias","last_name":"Petrou","email":"mpetrou2g@mysql.com","gender":"Genderqueer"},{"id":90,"first_name":"Amberly","last_name":"Benzies","email":"abenzies2h@apache.org","gender":"Female"},{"id":91,"first_name":"Linette","last_name":"Mourbey","email":"lmourbey2i@histats.com","gender":"Female"},{"id":92,"first_name":"Burnaby","last_name":"Vasyukhin","email":"bvasyukhin2j@yelp.com","gender":"Male"},{"id":93,"first_name":"Vinson","last_name":"Saterweyte","email":"vsaterweyte2k@cmu.edu","gender":"Male"},{"id":94,"first_name":"Delmor","last_name":"Beddie","email":"dbeddie2l@goo.ne.jp","gender":"Male"},{"id":95,"first_name":"Aigneis","last_name":"Barton","email":"abarton2m@goo.ne.jp","gender":"Female"},{"id":96,"first_name":"Feliza","last_name":"Cloonan","email":"fcloonan2n@taobao.com","gender":"Female"},{"id":97,"first_name":"Dallon","last_name":"Oglevie","email":"doglevie2o@un.org","gender":"Agender"},{"id":98,"first_name":"Wallie","last_name":"Harkess","email":"wharkess2p@illinois.edu","gender":"Female"},{"id":99,"first_name":"Moll","last_name":"Axston","email":"maxston2q@com.com","gender":"Female"},{"id":100,"first_name":"Babita","last_name":"Lynn","email":"blynn2r@deliciousdays.com","gender":"Female"}]';

  List<Student> findAll() {
    List<Student> stuList = [];
    var allJson = jsonDecode(_students) as List;
    // decode chuyen tu 1 string ve list
    for (Map<String, dynamic> json in allJson) {
      var stu = Student.fromJson(json);
      stuList.add(stu);
    }
    return stuList;
  }

  // cach khac dung map
  List<Student> findAllUsingMap() {
    List<dynamic> allJson = jsonEncode(_students) as List<dynamic>;
    return allJson.map((json) => Student.fromJson(json)).toList();
    // xu li logic 1 dong thi dung arrow function dc
    // map la ham cua list xu li logic trong list => tra ve mang moi Iterable da dc xu li logic
    //   return allJson.map((json) {
    //     return Student.fromJson(json);
    //   }).toList();
    // }
  }
}
