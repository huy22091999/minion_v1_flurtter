import 'package:minion_v1/core/base_event.dart';
import 'package:minion_v1/data/model/user.dart';

class AddUserEvent extends BaseEvent {
  User newUser;

  AddUserEvent({required this.newUser});
}
