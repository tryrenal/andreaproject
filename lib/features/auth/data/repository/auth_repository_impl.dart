import 'package:andreaproject/core/error/exception.dart';
import 'package:andreaproject/core/error/failures.dart';
import 'package:andreaproject/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:andreaproject/features/auth/domain/entities/user.dart';
import 'package:andreaproject/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failures, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failures, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();

      return right(user);
    } on sb.AuthException catch (e) {
      print(e.message.toString());
      return left(Failures(e.message));
    } on ServerException catch (e) {
      print(e.message.toString());
      return left(Failures(e.message));
    }
  }
}
