import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-4/argument_second_page.dart';

class ArgumentFirstPage extends StatelessWidget {
  const ArgumentFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Argument Example'),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          children: [
            Text(
              "Hello Argument Page",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Get.to(ArgumentSecondPage(), arguments: {
                  "name": "Luffy",
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Send Luffy'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Get.toNamed('/argumentSecondPage', arguments: {
                  "name": "Indy",
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Send Indy by Get.toNamed'),
            ),
          ],
        ),
      ),
    );
  }
}
