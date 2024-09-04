import 'package:flutter/material.dart';
import 'package:todo/Pages/AddTask.dart';
import 'package:todo/Pages/Editing%20Screen.dart';
import 'package:todo/Pages/HomeScreen.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homescreen.routeName: (_) => Homescreen(),
        Addtask.routeName: (_) => Addtask(),
        Edit.routeName: (_) => Edit(),
      },
      initialRoute: Homescreen.routeName,
    );
  }
}
