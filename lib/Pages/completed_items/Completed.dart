import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/Pages/edit_items/Editing%20Screen.dart';
import 'package:todo/Pages/cuibt/todos_cubit.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          final completedItem =
              state.todos.where((element) => element.isChecked).toList();
          // final completedTodos = state.completedTodos;
          if (completedItem.isEmpty) {
            return const Center(
              child: Text("No Completed Tasks Found"),
            );
          }
          return ListView.builder(
            itemCount: completedItem.length,
            itemBuilder: (context, index) {
              final todoItem = completedItem[index];
              if (state.todos.isEmpty) {
                return const Center(
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
            },
          );
        } else {
          return const Center(
            child: Text("No Completed Tasks Found"),
          );
        }
      },
    );
  }
}
