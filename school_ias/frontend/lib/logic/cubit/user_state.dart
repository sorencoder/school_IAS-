import 'package:frontend/data/model/user_model.dart';

abstract class UserStates {}

class InititalState extends UserStates {}

class LoadingState extends UserStates {}

class LoggedInState extends UserStates {
  final UserModel userModel;
  LoggedInState(this.userModel);
}

class LogOutState extends UserStates {}

class ErrorState extends UserStates {
  final String message;
  ErrorState(this.message);
}
