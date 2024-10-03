import 'package:flutter/material.dart';

class GridViewCountPage extends StatelessWidget {
  const GridViewCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // กำหนดจำนวนคอลัมน์
        children: List.generate(20, (index) {
          return Card(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }
}
