import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../services/service.dart';

class DataController extends GetxController {
  DataService dataService = DataService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<dynamic> getData() async {
    _isLoading = true;
    Response response = await dataService.getData();

    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got a data");
      // print(_myData);
      update();
      return _myData;
    } else {
      print("we did not get any data");
      return 0;
    }
  }
}
