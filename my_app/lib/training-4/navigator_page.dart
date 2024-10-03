import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-4/navigator_1_page.dart';
import 'package:my_app/training-4/navigator_2_page.dart';
import 'package:my_app/training-4/navigator_3_page.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

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
                "Hello Navigator!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const Navigator1Page());
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 1'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const Navigator2Page());
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 2'),
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
            ],
          ),
        ));
  }
}
