import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/logic/cubit/user_state.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(InititalState());

  void createAccount({required email, required password}) async {
    try {} catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void signIn({required email, required password}) async {}
}
