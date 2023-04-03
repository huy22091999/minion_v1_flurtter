class UserCredential {
  String? clinetId;
  String? grantType;
  String? clientSecret;
  String? username;
  String? password;

  UserCredential(
      {this.clinetId,
      this.grantType,
      this.clientSecret,
      this.username,
      this.password});

  UserCredential.fromJson(Map<String, dynamic> json) {
    clinetId = json['clinet_id'];
    grantType = json['grant_type'];
    clientSecret = json['client_secret'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinet_id'] = this.clinetId;
    data['grant_type'] = this.grantType;
    data['client_secret'] = this.clientSecret;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
