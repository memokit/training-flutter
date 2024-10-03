import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Example'),
        ),
        body: Column(
          children: [
            Text("Image.asset"),
            Image.asset(
              'assets/images/cat.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text("Image.asset"),
            Image.network(
              'https://images.unsplash.com/photo-1503777119540-ce54b422baff?q=80&w=2786&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: 200,
              height: 200,
            )
          ],
        ));
  }
}
