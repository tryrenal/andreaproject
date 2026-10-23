import 'package:andreaproject/counter_app/home_page.dart';
import 'package:andreaproject/users_example/home_screen.dart';
import 'package:andreaproject/users_example/user_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: const MyHomePage(title: 'Counter App'),
    // );

    return MaterialApp(
      title: 'Users Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(futureUsers: UserRepository().fetchUsers()),
    );
  }
}
