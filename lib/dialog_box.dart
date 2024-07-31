import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback OnAdd;
  final VoidCallback OnCancel;
  DialogBox({super.key, required this.controller,required this.OnAdd,required this.OnCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Add a new task",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter task name",
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //save
                MyButton(text: "Add", onPressed: OnAdd),
                const SizedBox(width: 20),
                //cancel
                MyButton(text: "Cancel", onPressed: OnCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
