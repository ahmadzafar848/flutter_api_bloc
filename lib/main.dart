import 'package:bloc_api_practice/app_bloc/app_bloc.dart';
import 'package:bloc_api_practice/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AppBloc>(
          create: (BuildContext context) {
            return AppBloc();
          },
          child: HomePage()),
    );
  }
}
