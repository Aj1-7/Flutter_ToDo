import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  ToDoTile(
      {Key? key,
      required this.taskName,
      required this.isDone,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteTask,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  //checkbox
                  Checkbox(
                    value: isDone,
                    onChanged: onChanged,
                    activeColor: Colors.deepPurple,
                  ),

                  //text box

                  Text(
                    taskName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              )),
        ));
  }
}
