class User {
  int? id;
  String? displayName;
  String? username;
  String? password;
  Null? confirmPassword;
  bool? changePass;
  bool? active;
  Null? lastName;
  Null? firstName;
  Null? dob;
  Null? birthPlace;
  String? email;
  bool? hasPhoto;
  List<Roles>? roles;
  bool? setPassword;

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
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    setPassword = json['setPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['username'] = this.username;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['changePass'] = this.changePass;
    data['active'] = this.active;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['dob'] = this.dob;
    data['birthPlace'] = this.birthPlace;
    data['email'] = this.email;
    data['hasPhoto'] = this.hasPhoto;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['setPassword'] = this.setPassword;
    return data;
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