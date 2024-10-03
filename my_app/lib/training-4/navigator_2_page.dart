import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-4/navigator_3_page.dart';

class Navigator2Page extends StatelessWidget {
  const Navigator2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigator Example'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              Text(
                "Hello Navigator! Page 2",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const Navigator3Page());
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 3'),
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
                child: const Text('Get.back()'),
              ),
            ],
          ),
        ));
  }
}
