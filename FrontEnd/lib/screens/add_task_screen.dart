import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_managment/utils/app_colors.dart';
import 'package:task_managment/widgets/button_widget.dart';
import 'package:task_managment/widgets/textField_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/addtask1.jpg"),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.smallTextColor,
                      size: 27,
                    ))
              ],
            ),
            Column(
              children: [
                TextFiledWidget(
                  textController: nameController,
                  hintText: "Task Name",
                  borderRadius: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledWidget(
                  textController: detailController,
                  hintText: "Task Details",
                  borderRadius: 20,
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonWidget(
                  backgroundColor: AppColors.mainColor,
                  text: "Add",
                  textColor: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
          ],
        ),
      ),
    );
  }
}
