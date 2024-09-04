import 'package:flutter/material.dart';
import 'package:todo/Pages/HomeScreen.dart';

class Addtask extends StatefulWidget {
  static const String routeName = "AddTask";

  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  Homescreen _homeScreen = Homescreen();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9395D3),
        actions: const [
          Icon(Icons.arrow_back_sharp),
        ],
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: "Title",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: "Detail",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.07,
                ),
                backgroundColor: const Color(0xff9395D3),
              ),
              onPressed: () {
                setState(() {

                });
              },
              child: Text(
                "add".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

