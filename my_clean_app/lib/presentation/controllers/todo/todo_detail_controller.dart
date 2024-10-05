import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/data/models/todo_model.dart';
import 'package:my_clean_app/domain/usecases/todo/get_todo_data_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/update_todo_use_case.dart';
import 'package:my_clean_app/presentation/controllers/todo/todo_controller.dart';
import 'package:tuple/tuple.dart';

class TodoDetailController extends GetxController {
  final GetTodoDataUseCase getTodoDataUseCase;
  final UpdateTodoUseCase updateTodoUseCase;

  TodoDetailController({
    required this.getTodoDataUseCase,
    required this.updateTodoUseCase,
  });

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
      ResponseModel result = await getTodoDataUseCase.call(id);

      nameCtr.text = result.data.name ?? "";
    } catch (e) {}
  }

  updateData(String name) async {
    try {
      ResponseModel result = await updateTodoUseCase.call(Tuple2(id, name));

      if (result.data) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        TodoController toCtr = Get.find();
        toCtr.getList();
      }
    } catch (e) {}
  }
}
