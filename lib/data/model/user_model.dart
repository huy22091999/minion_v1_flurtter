import 'package:flutter/cupertino.dart';
import 'package:minion_v1/data/model/user.dart';

class UserModel extends ChangeNotifier {
  User user = User();

  User getUser() {
    return user;
  }

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }
}
