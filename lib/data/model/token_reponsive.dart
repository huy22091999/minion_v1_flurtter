class TokenReponsive {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;

  TokenReponsive(
      {this.accessToken, this.tokenType, this.refreshToken, this.expiresIn});

  TokenReponsive.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}