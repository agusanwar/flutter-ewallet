import 'package:aipay/models/signin_form_model.dart';
import 'package:aipay/models/signup_form_model.dart';
import 'package:aipay/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:aipay/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            // loading
            emit(AuthLoading());

            final res = await AuthServices().checkEmail(event.email);

            if (res == false) {
              emit(AuthCheckEmailSuccess());
            } else {
              emit(
                const AuthFailed('Email sudah terdaftar'),
              );
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthRegister) {
          try {
            // loading
            emit(AuthLoading());

            final user = await AuthServices().register(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogin) {
          try {
            // 1. Loading Screen
            emit(AuthLoading());

            // 2. auth service get data
            final user = await AuthServices().login(event.data);

            // 3. jika berhasil get data
            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            // 1. Loading Screen
            emit(AuthLoading());

            // 2. auth service get data
            final SignInFormModel data =
                await AuthServices().getCredentialLocal();

            // 3. untuk login ulang
            final UserModel user = await AuthServices().login(data);

            // 4. jika berhasil get data
            emit(AuthSuccess(user));
          } catch (e) {
            // 5. jika gagal
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
