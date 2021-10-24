import 'package:flutter/material.dart';
import 'package:task_6_3_1/pages/finish_page.dart';
import 'package:task_6_3_1/pages/sign_in.dart';
import 'package:task_6_3_1/pages/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
      routes: {
        SignIn.id:(context) => const SignIn(),
        SignUp.id:(context) => const SignUp(),
        FinishPage.id:(context) => const FinishPage(),
      },
    );
  }
}

