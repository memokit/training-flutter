import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  final List<String> items = List<String>.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การสร้าง ListView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('ListView แบบธรรมดา'),
            SizedBox(
              height: 200,
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text("Photo"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Phone"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('ListView.builder สำหรับรายการจำนวนมาก'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.label),
                    title: Text(items[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('ListView.separated สำหรับรายการที่มีตัวแบ่ง (Divider)'),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.star),
                    title: Text(items[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(); // ตัวแบ่งระหว่างรายการ
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
