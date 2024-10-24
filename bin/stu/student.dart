import 'dart:convert';

class Student {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _gender;

  Student(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? gender}) {
    if (id != null) {
      this._id = id;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (gender != null) {
      this._gender = gender;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get firstName => _firstName;

  set firstName(String? firstName) => _firstName = firstName;

  String? get lastName => _lastName;

  set lastName(String? lastName) => _lastName = lastName;

  String? get email => _email;

  set email(String? email) => _email = email;

  String? get gender => _gender;

  set gender(String? gender) => _gender = gender;

  Student.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['email'] = this._email;
    data['gender'] = this._gender;
    return data;
  }
}

