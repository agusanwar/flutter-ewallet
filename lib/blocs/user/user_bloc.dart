import 'package:aipay/models/user_model.dart';
import 'package:aipay/services/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      // user get by username
      if (event is UserGetByUsername) {
        try {
          // loading
          emit(UserLoaading());

          // prosess
          final users = await UserServices().getUserByUsername(event.username);

          // success
          emit(UserSuccess(users));
        } catch (e) {
          // failed
          emit(UserFailed(e.toString()));
        }
      }

      // user get recent
      if (event is UserGetRecent) {
        try {
          // loading
          emit(UserLoaading());

          // prosess
          final users = await UserServices().getRecentUsers();

          // success
          emit(UserSuccess(users));
        } catch (e) {
          // failed
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
