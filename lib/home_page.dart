import 'package:andreaproject/bloc/counter_bloc.dart';
import 'package:andreaproject/cubit/counter_cubit.dart';
import 'package:andreaproject/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const Text('You have pushed the button this many times:'),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, counter){
                   return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } 
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IncDecPage()));
            },
            child: Icon(Icons.navigate_next),
          ),
        );
  }
}
