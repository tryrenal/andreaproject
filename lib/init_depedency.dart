import 'package:andreaproject/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:andreaproject/core/secrets/app_secrets.dart';
import 'package:andreaproject/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:andreaproject/features/auth/data/repository/auth_repository_impl.dart';
import 'package:andreaproject/features/auth/domain/repository/auth_repository.dart';
import 'package:andreaproject/features/auth/domain/usecases/current_user.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_login.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_sign_up.dart';
import 'package:andreaproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:andreaproject/features/blog/data/data_sources/blog_remote_data_source.dart';
import 'package:andreaproject/features/blog/data/repository/blog_repository_impl.dart';
import 'package:andreaproject/features/blog/domain/repository/blog_repository.dart';
import 'package:andreaproject/features/blog/domain/usecases/upload_blog.dart';
import 'package:andreaproject/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDepedencies() async {
  _initAuth();
  _initBlog();
  final supaBase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    publishableKey: AppSecrets.supaBasePublishedKey,
  );

  serviceLocator.registerLazySingleton(() => supaBase.client);

  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initBlog() {
  serviceLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(serviceLocator()),
    )
    ..registerFactory(() => UploadBlog(serviceLocator()))
    ..registerLazySingleton(() => BlogBloc(uploadBlog: serviceLocator()));
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
