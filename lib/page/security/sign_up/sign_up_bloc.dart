import 'dart:async';

import 'package:minion_v1/core/base_bloc.dart';
import 'package:minion_v1/core/base_event.dart';
import 'package:minion_v1/data/model/user.dart';
import 'package:minion_v1/page/security/sign_up/sign_up_event.dart';

import '../../../data/repository/sign_up_repository.dart';

class SignInBloc extends BaseBloc {
  final StreamController<User> _userController = StreamController();
  Stream<User> get streamUser => _userController.stream;
  SignUpRepository repository = SignUpRepository();

  _createUser(User user) {
    var userResponsive = repository.createUser(user);
    userResponsive.then((value) => {_userController.sink.add(value)});
  }



  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddUserEvent) {
      _createUser(event.newUser);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
