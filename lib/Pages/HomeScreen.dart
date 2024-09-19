import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/Pages/AddTask.dart';
import 'package:todo/Pages/Completed.dart';
import 'package:todo/Pages/Editing%20Screen.dart';
import 'package:todo/Pages/ToDoItemModel.dart';
import 'package:todo/Pages/ToDoListItem.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> Tabs = [
    const ToDoListItem(),
    const Completed(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6D7EF),

      appBar: AppBar(
        actions: const [
          Icon(Icons.date_range_sharp),
        ],
        title: const Text("ToDoApp"),
        backgroundColor: const Color(0xff9395D3),
      ),

      body: Tabs[currentIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) => const Addtask(),
              elevation: 15);
        },
        backgroundColor:  Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(label: "All", icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                label: "Complete", icon: Icon(Icons.check_outlined))
          ]),
    );
  }
}
