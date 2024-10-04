import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DioMainPage extends StatelessWidget {
  const DioMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dio Main Page'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed("/todoPage");
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go Todo Page'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
