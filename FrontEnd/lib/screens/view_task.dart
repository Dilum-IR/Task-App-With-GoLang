import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_managment/contollers/data_controller.dart';
import 'package:task_managment/utils/app_colors.dart';

class ViewTask extends StatefulWidget {
  final String id;

  ViewTask({Key? key, required this.id}) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  late Map<String, dynamic> singleData;
  bool is_loading = false;
  // get find task data
  void getTaskData() async {
    await Get.find<DataController>().findTask(int.parse(widget.id));

    singleData = Get.find<DataController>().findData;

    print(singleData);

    if (singleData.isNotEmpty) {
      setState(() {
        is_loading = !is_loading;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getTaskData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.mainColor,
                  ),
                ),
                const Text(
                  "View Task Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: is_loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Text(
                                singleData['task_name'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                singleData['task_details'],
                              ),
                              Text(
                                singleData['date'],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
            ),
          ],
          // color: Colors.redAccent,
        ),
      ),
    );
  }
}
