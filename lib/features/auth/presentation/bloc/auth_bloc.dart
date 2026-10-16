import 'package:andreaproject/features/auth/domain/entities/user.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
    : _userSignUp = userSignUp,
      super(AuthInitial()) {
    on<AuthSignUp>((event, state) async {
      emit(AuthLoading());

      final res = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );

      return res.fold(
        (error) => emit(AuthFailure(error.message)),
        (user) => emit(AuthSuccess(user: user)),
      );
    });
  }
}
