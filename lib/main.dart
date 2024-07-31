import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Import the hive package
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/home_page.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();

  //open a box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
