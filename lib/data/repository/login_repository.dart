import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minion_v1/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/token_reponsive.dart';
import '../model/user.dart';
import '../model/user_credential.dart';

const BASE_URL = "http://mita.oceantech.com.vn/mita";
const TOKEN = "token";

class LoginRepository {
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(TOKEN);
    token = token == null ? "Basic Y29yZV9jbGllbnQ6c2VjcmV0" : "Bearer $token";
    return token;
  }

  User parseUser(String responseBody) {
    var user = json.decode(responseBody) as dynamic;
    User object = User.fromJson(user);
    return object;
  }

  TokenReponsive parseToken(String responseBody) {
    var token = json.decode(responseBody) as dynamic;
    TokenReponsive object = TokenReponsive.fromJson(token);

    return object;
  }

  Future<User> fetchUser() async {
    Future<User>? user;
    await getToken().then((value) => {
      user = getUser(value)
    });
    return user != null ? user! : Future.value(User());
  }

  Future<User> getUser(String token) async {
    var uri = Uri.parse("$BASE_URL/users/get-user-current");
    final response =
        await http.get(uri, headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 200) {
      log(response.body);
      return compute(parseUser, response.body);
    } else {
      log("can not get user");
      return Future.value(User());
    }
  }

  Future<TokenReponsive> fetchToken(String username, String password) async {
    var uri = Uri.parse("$BASE_URL/oauth/token");

    var user = UserCredential(
        clinetId: "core_client",
        grantType: "password",
        clientSecret: "secret",
        username: username,
        password: password);

    final response = await http.post(
      uri,
      body: user.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: 'Basic Y29yZV9jbGllbnQ6c2VjcmV0',
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      var token = parseToken(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(TOKEN, token.accessToken!);
      return compute(parseToken, response.body);
    } else {
      log("can not getToken ${response.statusCode}");
      return Future.value(TokenReponsive());
    }
  }
}
