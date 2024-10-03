import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-4/navigator_page.dart';

class Navigator3Page extends StatelessWidget {
  const Navigator3Page({super.key});

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
                "Hello Navigator! Page 3",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.offAll(() => const NavigatorPage());
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Get.offAll to Main'),
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
