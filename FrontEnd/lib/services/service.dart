import 'package:get/get.dart';
import 'package:task_managment/utils/api_constraints.dart';

class DataService extends GetConnect implements GetxService {
  // get all data method
  Future<Response> getData() async {
    Response response = await get(
      Constraints.GET_TASKS,
      headers: {'Content-Type': 'application/json; charset= UTF-8'},
    );
    // print(response.bodyBytes);
    return response;
  }

  // post for the create to the new Task method
  // body parameter is Json type
  Future<Response> postData(dynamic body) async {
    Response response = await post(
      Constraints.POST_TASK,
      body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    // print(response.bodyBytes);
    return response;
  }

  Future<Response> getTaskData(int id) async {
    Response response = await get(
      "${Constraints.GET_TASK}/$id",
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    return response;
  }

  Future<Response> updateTaskData(String id, dynamic body) async {
    Response response = await put(
      "${Constraints.UPDATE_TASK}/$id",
      body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    // print(response.bodyBytes);
    return response;
  }
}
