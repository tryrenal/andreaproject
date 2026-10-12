// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print('AuthBloc - $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print('AuthBloc Trans - $transition');
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

    final email = event.email;
    final password = event.password;

    try {
      if (!emailRegex.hasMatch(email)) {
        emit(AuthFailure('Please enter a valid email address'));
        return;
      }

      if (password.length < 6) {
        emit(AuthFailure('password cant be less than 6 character'));
        return;
      }

      //mock source of data
      await Future.delayed(Duration(seconds: 1), () {
        emit(AuthSuccess(uid: '$email-$password'));
        return;
      });
    } on Exception catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> state,
  ) async {
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 1), () {
        emit(AuthInitial());
        return;
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
