import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Pages/model/ToDoItemModel.dart';
import 'package:todo/Pages/cuibt/todos_cubit.dart';

class Edit extends StatefulWidget {
  static const String routeName = "edit";

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    final todoItem =
        ModalRoute.of(context)!.settings.arguments as ToDoItemModel;
    TextEditingController titleController =
        TextEditingController(text: todoItem.title);
    TextEditingController descriptionController =
        TextEditingController(text: todoItem.description);
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9395D3),
        title: const Text("Edit Task"),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(builder: (
        context,
        state,
      ) {
        if (state is TodosSucceed) {
          return Padding(
            padding: EdgeInsets.all(heightSize * 0.02),
            child: Column(
              children: [
                TextFormField(
                  maxLength: 100,
                  controller: titleController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    labelText: "Title",
                  ),
                ),
                SizedBox(
                  height: heightSize * 0.015,
                ),
                TextFormField(
                  maxLength: 250,
                  maxLines: 4,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    labelText: "Detail",
                  ),
                ),
                SizedBox(height: heightSize * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 15,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.4,
                          MediaQuery.of(context).size.height * 0.1,
                        ),
                        backgroundColor: const Color(0xff9395D3),
                      ),
                      onPressed: () {
                        context.read<TodosCubit>().updateTodo(
                             todoItem.id,
                              titleController.text,
                              descriptionController.text,
                            );
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: widthSize * 0.015,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 15,
                        minimumSize: Size(
                          widthSize * 0.4,
                          heightSize * 0.1,
                        ),
                        backgroundColor: const Color(0xff9395D3),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
