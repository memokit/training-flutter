import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Widgets Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.home),
                Icon(Icons.settings),
              ],
            ),
            Text('Welcome to Flutter!'),
          ],
        ),
      ),
    );
  }
}
