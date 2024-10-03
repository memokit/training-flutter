import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Icon Example'),
        ),
        body: const Column(
          children: [
            Icon(
              Icons.home,
              color: Colors.green,
              size: 40.0,
            ),
            ImageIcon(
              AssetImage('assets/icons/check.png'),
              color: Colors.blue,
              size: 40,
            ),
          ],
        ));
  }
}
