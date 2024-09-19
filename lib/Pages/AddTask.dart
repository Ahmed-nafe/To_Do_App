import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Pages/ToDoItemModel.dart';
import 'package:todo/Pages/ToDoListItem.dart';
import 'package:todo/Pages/todos_cubit.dart';

class Addtask extends StatefulWidget {
  static const String routeName = "AddTask";

  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ToDoListItem toDoListItem = const ToDoListItem();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "You must Enter a task title";
                  }
                  if (value.length < 4) {
                    return "You must Enter More than 4 Characters";
                  }
                  return null;
                },
                maxLength: 200,
                textInputAction: TextInputAction.next,
                controller: titleController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Title",
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "You must Enter a task description";
                  }
                  if (value.length < 20) {
                    return "You must Enter More than 20 Characters";
                  }
                  return null;
                },
                controller: descriptionController,
                maxLength: 200,
                maxLines: 3,
                textInputAction: TextInputAction.send,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Detail",
                ),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    if (formKey.currentState!.validate()) {
                      context.read<TodosCubit>().addTodosItemToList(
                            ToDoItemModel(
                              title: titleController.text,
                              description: descriptionController.text,
                            ),
                          );
                      Navigator.pop(context);
                    }
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
      ),
    );
  }
}
