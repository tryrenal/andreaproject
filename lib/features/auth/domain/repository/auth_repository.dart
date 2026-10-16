import 'package:andreaproject/core/error/failures.dart';
import 'package:andreaproject/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failures, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
