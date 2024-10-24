import 'dart:math';
import 'dart:io';

void main() {
  // var list = inputList();
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // findMinAndMax(list);
  //findMinAndMaxEven(list);
  countEvenAndOddOfListAndSum(list);
}

List<int> inputList() {
  print('Nhap danh sach:');
  List<int> listNumbers = [];
  // int count = 0;
  // while (true) {
  //   try {
  //     print('Nhap so ${count+1} :');
  //     int num = int.parse(stdin.readLineSync()!);
  //     listNumbers.add(num);
  //     count++;
  //     if (count == 10) {
  //       return listNumbers;
  //     }
  //   } catch (e) {
  //     print('Nhap sai roi, nhap lai di!');
  //   }
  for (int i = 0; i < 10; i++) {
    try {
      print('Nhap so ${i + 1} :');
      int num = int.parse(stdin.readLineSync()!);
      listNumbers.add(num);
    } catch (e) {
      print('Nhap sai roi, nhap lai di!');
    }
  }
  return listNumbers;
}

void findMinAndMax(List<int> list) {
  // int maxVal = list.reduce(max);
  // int minVal = list.reduce(min);
  // print('Số lớn nhất: $maxVal');
  // print('Số nhỏ nhất: $minVal');

  // int maxVal = list.reduce((curr, next) => curr > next ? curr : next);
  // int minVal = list.reduce((curr, next) => curr < next ? curr : next);
  // print('Số lớn nhất: $maxVal');
  // print('Số nhỏ nhất: $minVal');

  // int min = list[0];
  // int max =list[0];
  // for (int i = 1; i < list.length; i++) {
  //   if(min>list[i]){
  //     min = list[i];
  //   }
  //   if(max<list[i]){
  //     max = list[i];
  //   }
  // }
  //   print('Min: $min');
  //   print('Max: $max');

  int findMaxRecursive(List<int> list, int n) {
    if (n == 1) {
      return list[0];
    }
    return max(list[n - 1], findMaxRecursive(list, n - 1));
    // phan tu vi tri 9,
  }

  int findMinRecursive(List<int> list, int n) {
    if (n == 1) {
      return list[0];
    }
    return min(list[n - 1], findMinRecursive(list, n - 1));
  }

  int maxNum = findMaxRecursive(list, list.length);
  int minNum = findMinRecursive(list, list.length);
  print(maxNum);
  print(minNum);
}

void findMinAndMaxEven(List<int> list) {
  List<int> even = list.where((x) => (x % 2 == 0)).toList();
  int maxVal = even.reduce(max);
  int minVal = even.reduce(min);

  int? maxEven = list.isNotEmpty ? list.reduce((a, b) => a > b ? a : b) : null;
  int? minEven = list.isNotEmpty ? list.reduce((a, b) => a < b ? a : b) : null;

  print(maxVal);
  print(minVal);

  // int? maxx;
  // int? minn;
  // list.forEach((num) {
  //   if (num.isEven) {
  //     if (maxx == null || num > maxx!) {
  //       maxx = num;
  //     }
  //     if (minn == null || num < minn!) {
  //       minn = num;
  //     }
  //   }
  // });
  // print(minn);
  // print(maxx);

  int? minn;
  int? maxx;
  for (int i = 1; i < list.length; i++) {
    int num = list[i];

    if (num.isEven) {
      if (maxx == null || num > maxx) {
        maxx = num;
      }
      if (minn == null || num < minn) {
        minn = num;
      }
    }
  }

  print('Min: $minn');
  print('Max: $maxx');
}

void countEvenAndOddOfListAndSum(List<int> list) {
  int countEven = 0;
  int countOdd = 0;
  int sumEven = 0;
  int sumOdd = 0;
  list.forEach((num) {
    num % 2 == 0 ? (countEven++, sumEven += num) : (countOdd++, sumOdd += num);
  });
  print('co ${countEven} so chan va ${countOdd} so le. Tong chan $sumEven, tong le $sumOdd');

  var result = list.fold(
      {'countOdd': 0, 'countEven': 0, 'sumOdd': 0, 'sumEven': 0}, (acc, num) {
    if (num.isEven) {
      acc['countEven'] = acc['countEven']! + 1;
      acc['sumEven'] = acc['sumEven']! + num;
    } else {
      acc['countOdd'] = acc['countOdd']! + 1;
      acc['sumOdd'] = acc['sumOdd']! + num;
    }
    return acc;
  });
  print('Số chẵn: ${result['countEven']}, Số lẻ: ${result['countOdd']}\n' +
      'Tong cac so chan : ${result['sumEven']}, tong cac so le  ${result['sumOdd']}');
}
