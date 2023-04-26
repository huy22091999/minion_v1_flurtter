import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

class User {
  int? id;
  String? displayName;
  String? username;
  String? password;
  String? confirmPassword;
  bool? changePass;
  bool? active;
  String? lastName;
  String? firstName;
  DateTime? dob;
  Null? birthPlace;
  String? email;
  bool? hasPhoto;
  List<Roles>? roles;
  bool? setPassword;
  String? gender;
  String? university;
  int? year; //năm 1-5, 6- đã tốt nghiêm


  User(
      {this.id,
      this.displayName,
      this.username,
      this.password,
      this.confirmPassword,
      this.changePass,
      this.active,
      this.lastName,
      this.firstName,
      this.dob,
      this.birthPlace,
      this.email,
      this.hasPhoto,
      this.roles,
      this.gender,
      this.university,
      this.year,
      this.setPassword});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    username = json['username'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    changePass = json['changePass'];
    active = json['active'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    dob = json['dob'];
    birthPlace = json['birthPlace'];
    email = json['email'];
    hasPhoto = json['hasPhoto'];
    gender = json['gender'];
    university = json['university'];
    year = json['year'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    setPassword = json['setPassword'];
  }

  String toJson() {
    String json='{'
        '"username":"$username",'
        '"password":"$password",'
        '"confirmPassword":"$confirmPassword",'
        '"lastName":"$lastName",'
        '"firstName":"$firstName",'
        '"gender":"$gender",'
        '"university":"$university",'
        '"email":"$email",'
        '"active":$active,'
        '"year":$year'
        ' }';
    log(json);
    return json;
  }
}

class Roles {
  int? id;
  String? name;
  Null? description;
  String? authority;

  Roles({this.id, this.name, this.description, this.authority});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['authority'] = this.authority;
    return data;
  }
}