import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-5/controllers/counter_controller.dart';

class GetxStatePage extends StatelessWidget {
  GetxStatePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Example")),
      body: Center(
        child: GetX<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Text("Count: ${controller.count}");
          },
        ), // UI จะรีเฟรชเมื่อ count เปลี่ยน
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
