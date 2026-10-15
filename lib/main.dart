import 'package:andreaproject/core/secrets/app_secrets.dart';
import 'package:andreaproject/core/theme/theme.dart';
import 'package:andreaproject/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:andreaproject/features/auth/data/repository/auth_repository_impl.dart';
import 'package:andreaproject/features/auth/domain/usecases/user_sign_up.dart';
import 'package:andreaproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:andreaproject/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supaBase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    anonKey: AppSecrets.supaBaseAnonKey,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(AuthRemoteDataSourceImpl(supaBase.client)),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dartThemeMode,
      home: LoginPage(),
    );
  }
}
