import 'package:flutter/material.dart';

class ButtonWidgetsPage extends StatelessWidget {
  const ButtonWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widgets Example'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Text Button'),
            TextButton(
              onPressed: () {},
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),
            const Text('Elevated Button'),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),
            const Text('Outlined Button'),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),
            const Text('Icon Button'),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              iconSize: 30.0,
              color: Colors.blue,
              tooltip: 'Like',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
