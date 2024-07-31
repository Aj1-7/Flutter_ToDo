import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ["Make omlette", false],
      ["Dance", true],
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void update() {
    _myBox.put("TODOLIST",todoList);
  }
}
