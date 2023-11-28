import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_managment/contollers/data_controller.dart';
import 'package:task_managment/screens/add_task_screen.dart';
import 'package:task_managment/screens/home.dart';
import 'package:task_managment/screens/view_all_task_screen.dart';

void main() {
  runApp(const TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      // home: const AddTaskScreen(),
      // home: const ViewTaskScreen(),
    );
  }
}
