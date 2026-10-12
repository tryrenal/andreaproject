import 'package:andreaproject/bloc/auth_bloc.dart';
import 'package:andreaproject/login_screen.dart';
import 'package:andreaproject/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          //impact is make all widget rebuild and recomposition to solve this use bloc builder
          // final authState = context.watch<AuthBloc>().state as AuthSuccess;

          return Column(
            children: [
              Center(child: Text((state as AuthSuccess).uid)),
              GradientButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
