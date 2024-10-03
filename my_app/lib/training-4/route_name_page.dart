import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteNamePage extends StatelessWidget {
  const RouteNamePage({super.key});

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
                "Hello Route Name!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed('/routeName2Page');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 2'),
              ),
            ],
          ),
        ));
  }
}
