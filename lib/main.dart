import 'package:flutter/material.dart';
import 'package:flutter_app_testing/cubit/user_cubit.dart';
import 'package:flutter_app_testing/view/add.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_testing/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add': (context) => AddPage(),
        },
      ),
    );
  }
}
