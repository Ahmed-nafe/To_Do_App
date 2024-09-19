import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Pages/todos_cubit.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          final completedTodos = state.completedTodos;
          return ListView.builder(
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              final todoItem = completedTodos[index];

              return Padding(
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                todoItem.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff9395D3),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                todoItem.description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
