import 'package:flutter/material.dart';
import 'package:task_managment/utils/app_colors.dart';
import 'package:task_managment/widgets/button_widget.dart';
import 'package:task_managment/widgets/taskBox_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  const ViewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myTask = [
      "Try Harder",
      "Try smarter",
    ];

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
          Icons.delete,
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
                  height: 60,
                ),
                IconButton(
                  onPressed: () {},
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        size: 27,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
                    const Text(
                      "2",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.secondaryColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: myTask.length,
                itemBuilder: (context, int index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightEditIcon,
                    key: ObjectKey(index),
                    onDismissed: (DismissDirection direction) {
                      print("object");
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      print(direction);
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.1)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const ButtonWidget(
                                        text: "Yes",
                                        backgroundColor: AppColors.mainColor,
                                        textColor: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ButtonWidget(
                                        text: "No",
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.4),
                                        textColor: AppColors.mainColor,
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
                    child: Container(
                      child: TaskWidget(
                        text: myTask[index],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
