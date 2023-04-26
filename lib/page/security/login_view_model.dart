
import 'package:minion_v1/data/model/token_reponsive.dart';
import 'package:minion_v1/data/model/user.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/repository/login_repository.dart';

class LoginViewModel{
  late final LoginRepository loginRepository;
  LoginViewModel({required this.loginRepository});
  final _userSubject = BehaviorSubject<User>();
  final _usernameSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _btnLoginSubject = BehaviorSubject<bool>();
  final _tokenSubject = BehaviorSubject<TokenReponsive>();

  Stream<String> get usernameStream => _usernameSubject.stream;
  Sink<String> get usernameSink => _usernameSubject.sink;

  Stream<String> get passwordStream => _passwordSubject.stream;
  Sink<String> get passwordSink => _passwordSubject.sink;

  Stream<bool> get btnLoginStream => _btnLoginSubject.stream;
  Sink<bool> get btnLoginSink => _btnLoginSubject.sink;

  Stream<TokenReponsive> get tokenStream => _tokenSubject.stream;
  Sink<TokenReponsive> get _tokenSink => _tokenSubject.sink;

  Future<User?> getCurrentUser() async {
    User? user;
    await loginRepository.fetchUser().then((value) => {
       user = value
    });
    return Future(() => user);

  }

  login(String username,String password){
    loginRepository.fetchToken(username, password).then((value) => {
      _tokenSink.add(value)
    });
  }

  dispose() {
    _userSubject.close();
  }
  getString(){
    return "test";
  }




}