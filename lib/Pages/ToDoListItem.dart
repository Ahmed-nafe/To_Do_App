import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/Pages/Editing%20Screen.dart';
import 'package:todo/Pages/ToDoItemModel.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({super.key});

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  List<ToDoItem> todos = [];
  TextEditingController controller = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        TextFormField(
          controller: controller,
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
              todos.add(ToDoItem(title: controller.text));
            });
          },
          child: Text(
            "add".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return _todoitem(todos[index]);
              }),
        )
      ],
    );
  }
  Widget _todoitem(ToDoItem value) {
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
                        value.title,
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
                        onTap: () {
                          setState(() {
                            todos.remove(value);
                          });
                        },
                        child: SvgPicture.asset("assets/images/Trash.svg")),
                    InkWell(
                      onTap: () {
                        setState(() {
                          value.isChecked == false
                              ? value.isChecked = true
                              : value.isChecked = false;
                        });
                      },
                      child: SvgPicture.asset(
                        "assets/images/CheckCircle.svg",
                        color: value.isChecked ? Colors.green : Colors.black26,
                      ),
                    ),
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
