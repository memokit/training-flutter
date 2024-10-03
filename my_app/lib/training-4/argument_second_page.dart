import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentSecondPage extends StatelessWidget {
  ArgumentSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // รับข้อมูลที่ส่งมาจาก ArgumentFirstPage
    final String name = Get.arguments["name"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Argument Example'),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          children: [
            Text(
              "Hello Argument Name! $name",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
