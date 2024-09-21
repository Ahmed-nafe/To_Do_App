import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Pages/AddTask.dart';
import 'package:todo/Pages/edit_items/Editing%20Screen.dart';
import 'package:todo/Pages/home_screen/HomeScreen.dart';
import 'package:todo/Pages/cuibt/todos_cubit.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Homescreen.routeName: (_) => Homescreen(),
          Edit.routeName: (_) => Edit(),
        },
        initialRoute: Homescreen.routeName,
      ),
    );
  }
}
