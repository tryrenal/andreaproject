import 'package:andreaproject/bloc/auth_bloc.dart';
import 'package:andreaproject/home_screen.dart';
import 'package:andreaproject/widgets/gradient_button.dart';
import 'package:andreaproject/widgets/login_field.dart';
import 'package:andreaproject/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //we can use bloc consumer that already include bloc listener and bloc builder
    // body: BlocListener<AuthBloc, AuthState>(
    //         listener: (context, state) {
    //           if (state is AuthFailure) {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               SnackBar(content: Text(state.error), backgroundColor: Colors.red),
    //             );
    //           }
    //           if (state is AuthSuccess) {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               SnackBar(
    //                 content: Text('Login successful! UID: ${state.uid}'),
    //                 backgroundColor: Colors.green,
    //               ),
    //             );

    //             Navigator.pushAndRemoveUntil(
    //               context,
    //               MaterialPageRoute(builder: (context) => const HomeScreen()),
    //               (route) => false,
    //             );
    //           }
    //         },
    //         child: BlocBuilder<AuthBloc, AuthState>(
    //           builder: (context, state) {
    //             if (state is AuthLoading){
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             }

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login successful! UID: ${state.uid}'),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/signin_balls.png'),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  const SizedBox(height: 50),
                  const SocialButton(
                    iconPath: 'assets/svgs/g_logo.svg',
                    label: 'Continue with Google',
                  ),
                  const SizedBox(height: 20),
                  const SocialButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                    label: 'Continue with Facebook',
                    horizontalPadding: 90,
                  ),
                  const SizedBox(height: 15),
                  const Text('or', style: TextStyle(fontSize: 17)),
                  const SizedBox(height: 15),
                  LoginField(hintText: 'Email', controller: emailController),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthLoginRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
