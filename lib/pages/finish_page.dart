import 'package:flutter/material.dart';

class FinishPage extends StatefulWidget {
  static const String id = "finish_page";

  const FinishPage({Key? key}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Text("Successfully login",style: TextStyle(fontSize: 24,color: Colors.white),),
      ),
    );
  }
}
