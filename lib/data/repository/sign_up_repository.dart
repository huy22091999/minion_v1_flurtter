import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minion_v1/data/model/user.dart';

import 'login_repository.dart';

class SignUpRepository {
  Future<User> createUser(User user) async {
    var uri = Uri.parse("$BASE_URL/public/sign");
    final response = await http.post(
      uri,
      body: user.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: 'Basic Y29yZV9jbGllbnQ6c2VjcmV0',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      return compute(parseUser, response.body);
    } else {
      log("can not getToken ${response.statusCode}");
      return Future.value(User());
    }
  }

  User parseUser(String responseBody) {
    var user = json.decode(responseBody) as dynamic;
    User object = User.fromJson(user);
    return object;
  }
}
