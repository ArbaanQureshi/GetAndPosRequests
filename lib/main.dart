import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getandpost/Cubit/GetApi/get_cubit.dart';
import 'package:getandpost/Cubit/PostApi/post_cubit.dart';
import 'package:getandpost/Views/GetApi.dart';
import 'package:getandpost/Views/PostApi.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCubit()..getCubitApi(),
        ),
        BlocProvider(
          create: (context) => PostCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostHomePage(),
      ),
    );
  }
}

