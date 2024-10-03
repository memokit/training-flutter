import 'package:flutter/material.dart';

class ListViewCustomPage extends StatelessWidget {
  ListViewCustomPage({super.key});

  // ข้อมูลตัวอย่าง
  final List<Map<String, String>> items = [
    {
      'title': 'Item 1',
      'subtitle': 'Subtitle 1',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 2',
      'subtitle': 'Subtitle 2',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 3',
      'subtitle': 'Subtitle 3',
      'image': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(items[index]['image']!),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['subtitle']!),
              onTap: () {
                // กำหนดเหตุการณ์เมื่อกดที่ไอเทม
                print('Tapped on ${items[index]['title']}');
              },
            ),
          );
        },
      ),
    );
  }
}
