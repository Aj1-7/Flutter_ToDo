import 'package:flutter/material.dart';
import 'package:to_do/database.dart';
import 'package:to_do/dialog_box.dart';
import 'package:hive/hive.dart'; // Import the hive package
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //first time
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //list of todo tasks

  void checkBoxChange(bool? val, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.update();
  }

  void AddNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            OnAdd: AddNewTask,
            OnCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deletefunc(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 163, 170, 213),
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite, size: 96)),
            ListTile(
              title: Text(
                "Made By Arjun",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            isDone: db.todoList[index][1],
            onChanged: (val) => checkBoxChange(val, index),
            deleteTask: (context) => deletefunc(index),
          );
        },
      ),
    );
  }
}
