import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-5/controllers/counter_controller.dart';

class StateMixinPage extends StatelessWidget {
  StateMixinPage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    controller.fetchData(); // เรียกใช้งานเมื่อ UI สร้าง

    return Scaffold(
      appBar: AppBar(title: Text("StateMixin Example")),
      body: controller.obx(
        (data) => ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) => ListTile(title: Text(data![index])),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // แสดง Loading
        onError: (error) => Center(child: Text("Error: $error")), // แสดง Error
      ),
    );
  }
}
