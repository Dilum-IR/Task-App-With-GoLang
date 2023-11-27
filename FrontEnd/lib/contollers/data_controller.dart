import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../services/service.dart';

class DataController extends GetxController {
  DataService dataService = DataService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await dataService.getData();

    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got a data");
      update();
    } else {
      print("we did not get any data");
    }
  }

  Future<void> postData(String taskName, String taskDetails) async {
    _isLoading = true;
    // pass the data using Json type
    Response response = await dataService.postData({
      "task_name": taskName,
      "task_details": taskDetails,
    });

    if (response.statusCode == 200) {
      update();
      print("post data success");
    } else {
      print("post data faild");
    }
  }
}
