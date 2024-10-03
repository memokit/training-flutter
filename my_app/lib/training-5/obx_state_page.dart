import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-5/controllers/counter_controller.dart';

class ObxStatePage extends StatelessWidget {
  ObxStatePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Obx Example")),
      body: Center(
        child: Obx(() => Text(
            "Count: ${controller.count}")), // UI จะรีเฟรชเมื่อ count เปลี่ยน
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
