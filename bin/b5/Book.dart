import 'dart:io';

class Book {
  late String _isbn;
  late String _name;
  late double _price;
  late String _author;

  Book(this._isbn, this._name, this._price, this._author);

  // Book();

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get isbn => _isbn;

  set isbn(String value) {
    _isbn = value;
  }

  String toString() =>
      'Book: $name, ISBN: $isbn, Author: $author, Price: $price';

  // named constructor
  Book.fromJson(Map<String, dynamic> json) {
    this._isbn = json['isbn'];
    this._name = json['name'];
    this._price = json['price'];
    this._author = json['author'];
  }

  Map<String, dynamic> toJson() => {
    'isbn': isbn,
    'name': name,
    'price': price,
    'author': author,
  };

  Map<String, dynamic> tooJson() {
    return {"isbn": isbn, "name": name, "price": price, "author": author};
  }
}


