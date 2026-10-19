import 'package:andreaproject/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:andreaproject/core/secrets/app_secrets.dart';
import 'package:andreaproject/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:andreaproject/features/auth/data/repository/auth_repository_impl.dart';
import 'package:andreaproject/features/auth/domain/repository/auth_repository.dart';
import 'package:andreaproject/features/auth/domain/usecases/current_user.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_login.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_sign_up.dart';
import 'package:andreaproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDepedencies() async {
  _initAuth();
  final supaBase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    publishableKey: AppSecrets.supaBasePublishedKey,
  );

  serviceLocator.registerLazySingleton(() => supaBase.client);

  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserLogin(serviceLocator()));
  serviceLocator.registerFactory(() => CurrentUser(serviceLocator()));

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}
