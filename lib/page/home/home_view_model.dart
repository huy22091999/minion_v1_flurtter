import 'package:minion_v1/page/home/home_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/model/user.dart';
import '../../data/repository/login_repository.dart';

class HomeViewModel {
  final HomeState state;
  final LoginRepository repository;


  HomeViewModel(this.state, {required this.repository}){
    getCurrentUser();
  }

  getCurrentUser() async {
    await repository.fetchUser().then((value) => {state.setUser(value)});
  }
}
