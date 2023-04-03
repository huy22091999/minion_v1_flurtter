import 'package:flutter/cupertino.dart';
import 'package:minion_v1/data/model/user.dart';

class HomeState with ChangeNotifier {
  User? _userCurrent;
  int count=0;

  User? getUser() {
    return _userCurrent;
  }

  void setUser(User? user) {
    _userCurrent = user;
    notifyListeners();
  }
  void setCount() {
    count++;
    notifyListeners();
  }
}
