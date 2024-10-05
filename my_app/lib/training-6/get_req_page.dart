import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_controller.dart';

class GetReqPage extends StatelessWidget {
  GetReqPage({super.key});

  final TodoController controller = Get.put(TodoController());

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
            ],
          )),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // แสดง Loading
        onError: (error) => Center(child: Text("Error: $error")), // แสดง Error
        onEmpty: Center(child: Text("No Data")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.fetchData(); // เรียก API เมื่อกดปุ่ม
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
