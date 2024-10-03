import 'package:flutter/material.dart';

class GridViewBuilderPage extends StatelessWidget {
  const GridViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Builder Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // จำนวนคอลัมน์
          crossAxisSpacing: 10.0, // ระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 10.0, // ระยะห่างระหว่างแถว
        ),
        itemCount: 50, // จำนวนรายการทั้งหมด
        itemBuilder: (context, index) {
          return Card(
            color: Colors.purpleAccent,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
