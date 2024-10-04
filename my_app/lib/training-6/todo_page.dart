import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_controller.dart';
import 'package:my_app/training-6/dio/dio_client.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final TodoController controller = Get.put(TodoController(DioClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length,
          itemBuilder: (context, index) => ListTile(
              title: Row(
            children: [
              Text("${state?[index].id} : "),
              Text(state?[index].name ?? ""),
              IconButton(
                onPressed: () {
                  Get.toNamed("/todoEditPage", arguments: {
                    "id": state?[index].id,
                  });
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  controller.delete(state?[index].id ?? "0");
                },
                icon: Icon(Icons.delete),
              )
            ],
          )),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // แสดง Loading
        onError: (error) => Center(child: Text("Error: $error")), // แสดง Error
        onEmpty: Center(child: Text("No Data")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/todoCreatePage");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
