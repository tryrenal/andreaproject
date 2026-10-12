import 'package:andreaproject/add_todo_page.dart';
import 'package:andreaproject/cubit/todo_cubit.dart';
import 'package:andreaproject/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.blue),
          useMaterial3: true
        ),
        initialRoute: '/',
        routes: {
          '/' : (_) => TodoList(),
          '/add-todo': (_) => AddTodoPage()
        },
      ),
    );
  }
}
