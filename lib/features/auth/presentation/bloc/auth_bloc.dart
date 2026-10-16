import 'package:andreaproject/features/auth/domain/entities/user.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_login.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;

  AuthBloc({required UserSignUp userSignUp, required UserLogin userLogin})
    : _userSignUp = userSignUp,
      _userLogin = userLogin,
      super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userLogin(
      UserLoginParams(email: event.email, password: event.password),
    );

    return res.fold(
      (error) => emit(AuthFailure(error.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
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
  }
}
