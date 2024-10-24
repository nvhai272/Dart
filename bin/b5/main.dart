import 'dart:convert';
import 'dart:io';
import 'Book.dart';

void main() async {
  List<Book> books = [];
  books.add(Book('isbn1', 'Ahihi', 12345, 'Author'));
  books.add(Book('isbn2', 'Ahihi', 12345, 'Author'));
  while (true) {
    print("Menu:\n"
        "1. Nhap thong tin 5 sach\n"
        "2. Display all books in list\n"
        "3. Export to JSON\n"
        "4. Import Book and display\n"
        "5. Exit\n"
        "Chon chuc nang di:");

    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 2:
        displayBooks(books);
        break;
      case 3:
        exportToJSON(books);
        break;
      case 4:
        await importBookAndDisplay();
        break;
      case 5:
        print("Exiting...");
        return;
      default:
        print("Invalid choice! Please try again.");
    }
  }
}

Future<void> importBookAndDisplay() async {
  // Đọc file JSON
  File file = File('books.json');
  if (!file.existsSync()) {
    print("File not found!");
    return;
  }

  try {
    String content = await file.readAsString();
    print('Nội dung file: $content');
    List<dynamic> data = jsonDecode(content);
    List<Book> books = data.map((json) => Book.fromJson(json)).toList();
    print('Dữ liệu sau khi parse ve List Book:');
    displayBooks(books);
  } catch (e) {
    print('Lỗi trong quá trình đọc và parse JSON: $e');
  }
}

void exportToJSON(List<Book> books) {
  try {
    String jsonString = jsonEncode(books);
    File('books.json').writeAsStringSync(jsonString);
    print(jsonString);
    print("Export to JSON successful!");
  } catch (e) {
    print("Error exporting to JSON: $e");
  }
}

void displayBooks(List<Book> books) {
  if (books.isEmpty) {
    print("Danh sách sách trống.");
  } else {
    int count = 0;
    print("Danh sách sách:");
    for (var book in books) {
      print('${++count}.${book.toString()}');
      print('  ');
    }
  }
}

addBooks(List<Book> books) {
  for (int i = 0; i < 1; i++) {
    print("Nhap thong tin sach thu ${i + 1}:");
    String isbn;
    while (true) {
      print("Nhap isbn:");
      isbn = stdin.readLineSync()!;
      if (isValidISBN(isbn)) {
        break;
      }
      print("Invalid ISBN! Please try again.");
    }
    String name;
    while (true) {
      print("Nhap name:");
      name = stdin.readLineSync()!;
      if (isValidName(name)) {
        break;
      }
      print("Invalid Name! Please try again.");
    }

    double price;
    while (true) {
      print("Nhap price:");
      price = double.parse(stdin.readLineSync()!);
      if (isValidPrice(price)) {
        break;
      }
      print("Invalid Price! Please try again.");
    }
    String author;
    while (true) {
      print("Nhap author:");
      author = stdin.readLineSync()!;
      if (isValidAuthor(author)) {
        break;
      }
      print("Invalid Author! Please try again.");
    }

    Book newbo = Book(isbn, name, price, author);
    books.add(newbo);
  }
}

bool isValidISBN(String isbn) {
  return isbn.length > 5;
}

bool isValidName(String name) {
  return name.length >= 5 && !name.contains(RegExp(r'[0-9]'));
}

bool isValidPrice(double price) {
  return price > 0;
}

bool isValidAuthor(String author) {
  return author.length > 10;
}
