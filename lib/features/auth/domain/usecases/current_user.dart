import 'package:andreaproject/core/error/failures.dart';
import 'package:andreaproject/core/usecase/usecase.dart';
import 'package:andreaproject/core/common/entities/user.dart';
import 'package:andreaproject/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements Usecase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failures, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
