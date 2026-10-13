import 'package:andreaproject/bloc/weather_bloc.dart';
import 'package:andreaproject/data/data_provider/weather_data_provider.dart';
import 'package:andreaproject/data/repository/weather_repository.dart';
import 'package:andreaproject/presentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
