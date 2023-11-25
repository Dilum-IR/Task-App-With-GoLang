import 'package:flutter/material.dart';
import 'package:task_managment/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  const TaskWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent.withOpacity(0.2)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
