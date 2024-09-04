import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  static const String routeName = "edit";
  TextEditingController controller =  TextEditingController();


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
              controller: controller,
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
                  onPressed: () {
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20,),
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
                  },
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
      ),
    );
  }
}
