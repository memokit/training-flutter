import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteName2Page extends StatelessWidget {
  const RouteName2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Route Name Example'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              Text(
                "Hello Route Name 2!",
                style: Theme.of(context).textTheme.headlineLarge,
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
        ));
  }
}
