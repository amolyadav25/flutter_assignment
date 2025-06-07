import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/customer/presentation/bloc/user_bloc.dart';
import 'package:flutter_assignment/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/customer/presentation/bloc/user_event.dart';
import 'features/customer/presentation/pages/my_home_page.dart';

void main() {
  setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()..add(FetchUsers())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

