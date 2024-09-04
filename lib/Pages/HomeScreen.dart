import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/Pages/AddTask.dart';
import 'package:todo/Pages/Editing%20Screen.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6D7EF),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.date_range_sharp),
          ),
        ],
        title: Text("TodoApp".toUpperCase()),
        backgroundColor: const Color(0xff9395D3),
      ),
      body: ListView(

        children: [

          for (final value in todos) _todoitem(value)
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Addtask.routeName);
        },
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xff9395D3),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _todoitem(String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff9395D3)),
                      ),
                      const Text(
                        "description",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Edit.routeName);
                        },
                        child: SvgPicture.asset("assets/images/Pencil.svg")),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset("assets/images/Trash.svg")),
                    InkWell(
                        onTap: () {},
                        child:
                        SvgPicture.asset("assets/images/CheckCircle.svg")),
                  ])
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
