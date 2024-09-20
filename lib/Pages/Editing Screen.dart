import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Pages/todos_cubit.dart';

class Edit extends StatelessWidget {
  static const String routeName = "edit";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9395D3),
        actions: const [
          Icon(Icons.arrow_back_sharp),
        ],
        title: const Text("Edit Task"),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(builder: (context, state) {
        if (state is TodosSucceed){
          return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Title",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Detail",
                ),
              ),
              const SizedBox(height: 40),
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
                    onPressed: () {},
                    child: const Text(
                      "Update",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
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
                    onPressed: () {},
                    child: const Text(
                      "Cancle",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
        }else{
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
