import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  // get all data method
  Future<Response> getData() async {
    Response response = await get(
      "http://172.20.10.10:8080/get_tasks",
      headers: {'Content-Type': 'application/json; charset= UTF-8'},
    );
    // print(response.bodyBytes);
    return response;
  }

  // post for the create to the new Task method
  // body parameter is Json type
  Future<Response> postData(dynamic body) async {
    Response response = await post(
      "http://172.20.10.10:8080/create",
      body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    // print(response.bodyBytes);
    return response;
  }
}
