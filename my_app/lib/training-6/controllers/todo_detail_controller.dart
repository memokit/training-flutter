import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_controller.dart';
import 'package:my_app/training-6/models/todo_model.dart';
import 'package:my_app/training-6/services/todo_service.dart';

class TodoDetailController extends GetxController {
  TextEditingController nameCtr = TextEditingController(text: "");

  Rxn<TodoModel> todo = Rxn<TodoModel>();
  String id = "0";

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
      TodoModel data = await TodoService().getData(id);

      nameCtr.text = data.name ?? "";
    } catch (e) {}
  }

  updateData(String name) async {
    try {
      bool result = await TodoService().update(id, name);

      if (result) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        TodoController toCtr = Get.find();
        toCtr.fetchData();
      }
    } catch (e) {}
  }
}
