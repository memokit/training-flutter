import 'package:dio/src/response.dart' as resp;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_controller.dart';
import 'package:my_app/training-6/dio/dio_client.dart';
import 'package:my_app/training-6/models/todo_model.dart';

class TodoDetailController extends GetxController {
  final DioClient dioClient;

  TextEditingController nameCtr = TextEditingController(text: "");

  Rxn<TodoModel> todo = Rxn<TodoModel>();
  String id = "0";

  TodoDetailController(this.dioClient);

  @override
  onInit() {
    super.onInit();
    id = Get.arguments["id"];
  }

  @override
  onReady() async {
    super.onReady();
    await getDetail();
  }

  getDetail() async {
    try {
      resp.Response response = await dioClient.dio.get('/page/$id');
      TodoModel data = TodoModel.fromJson(response.data);

      nameCtr.text = data.name ?? "";
    } catch (e) {}
  }

  Future<void> save(String name) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
      };

      resp.Response response = await dioClient.dio.put('/page/$id', data: body);

      if (response.statusCode == 200) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        TodoController toCtr = Get.find();
        toCtr.fetchData();
      }
    } catch (e) {}
  }
}
