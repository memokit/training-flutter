import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-5/controllers/counter_controller.dart';

class GetBuilderStatePage extends StatelessWidget {
  GetBuilderStatePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetBuilder Example")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller) => Text(
              "Count: ${controller.count}"), // UI จะรีเฟรชเมื่อ update ถูกเรียก
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.decrement,
        child: Icon(Icons.add),
      ),
    );
  }
}
