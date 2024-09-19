import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/Pages/Completed.dart';
import 'package:todo/Pages/Editing%20Screen.dart';
import 'package:todo/Pages/todos_cubit.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({super.key});

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  // List<ToDoItemModel> todos = [];
  TextEditingController controller = TextEditingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return toDoItemList();
  }

  Widget toDoItemList() {
    return BlocBuilder<TodosCubit, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          state.todos;
          return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todoItem = state.todos[index];
                if (state.todos.isEmpty) {
                  return Center(
                    child: Text("Your Deleted All Todos"),
                  );
                }
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
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      todoItem.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff9395D3)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      todoItem.description,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Edit.routeName);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/Pencil.svg")),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        context
                                            .read<TodosCubit>()
                                            .deleteTodoItem(index);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/Trash.svg")),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (!todoItem.isChecked) {
                                        context
                                            .read<TodosCubit>()
                                            .completedTodoItem(index);
                                        todoItem.isChecked =
                                            !todoItem.isChecked;
                                      }
                                      if (todoItem.isChecked) {
                                        context
                                            .read<TodosCubit>()
                                            .deleteTodoItemFromCompeleted(
                                                index);
                                        // state.completedTodos.remove(context);
                                        if (state is Completed) {}
                                      }
                                      todoItem.isChecked = !todoItem.isChecked;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/CheckCircle.svg",
                                    color: todoItem.isChecked
                                        ? Colors.green
                                        : Colors.grey,
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
              });
        } else {
          return const Center(child: Text("No Items Founded"));
        }
      },
    );
  }

  Widget complete() {
    // final completeedTask = todos.where((_element) => _element.isChecked ).toList();
    // return ListView.builder(
    //     itemCount: completeedTask.length,
    //     itemBuilder: (context, index) {
    //       return _todoitem(todos[index]);
    //     });
    return Container(
      color: Colors.red,
    );
  }
}
