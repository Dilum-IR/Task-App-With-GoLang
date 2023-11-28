import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:task_managment/screens/add_task_screen.dart';
import 'package:task_managment/screens/home.dart';
import 'package:task_managment/screens/view_task.dart';
import 'package:task_managment/utils/app_colors.dart';
import 'package:task_managment/widgets/button_widget.dart';
import 'package:task_managment/widgets/taskBox_widget.dart';

import '../contollers/data_controller.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({Key? key}) : super(key: key);

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  late List mydata;
  late bool is_data = false;
  late bool is_tap = false;

  void loadData() async {
    await Get.find<DataController>().getData();

    mydata = await Get.find<DataController>().myData;

    if (mydata.isNotEmpty) {
      setState(() {
        is_data = true;
      });
    }
    print(mydata);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.smallTextColor,
      alignment: Alignment.centerLeft,
      child: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header1.jpg"),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 27,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAll(
                          () => const Home(),
                          transition: Transition.fade,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 27,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () => AddTaskScreen(),
                          transition: Transition.fade,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 27,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month,
                        size: 27,
                      ),
                    ),
                    is_data
                        ? Text(
                            "${mydata.length}",
                            style: const TextStyle(
                                fontSize: 18, color: AppColors.secondaryColor),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: is_data
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: mydata.length,
                    itemBuilder: (context, int index) {
                      return Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightEditIcon,
                        key: ObjectKey(mydata[index]['id']),
                        onDismissed: (DismissDirection direction) {
                          // print("object");
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          // print(direction);
                          if (direction == DismissDirection.startToEnd) {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.blue,
                                          Colors.blueAccent.withOpacity(0.2),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                () => AddTaskScreen(),
                                                transition: Transition.fade,
                                                duration: const Duration(
                                                  milliseconds: 500,
                                                ),
                                              );
                                            },
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  () => ViewTask(
                                                    id: mydata[index]['id'],
                                                  ),
                                                );
                                              },
                                              child: const ButtonWidget(
                                                text: "View",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                textColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: ButtonWidget(
                                              text: "Edit",
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.4),
                                              textColor: AppColors.mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  );
                                });
                            return false;
                          } else {
                            return Future.delayed(const Duration(seconds: 1),
                                () => direction == DismissDirection.endToStart);
                          }
                        },
                        child: TaskWidget(
                          text: mydata[index]['task_name'],
                        ),
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
