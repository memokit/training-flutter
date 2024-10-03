
# การสร้าง List แบบกำหนดเอง (Custom ListView)

ในการสร้าง Custom ListView ใน Flutter คุณสามารถใช้ ```ListView.builder()``` หรือ ```ListView()``` ร่วมกับการออกแบบวิดเจ็ตเองเพื่อสร้างรายการที่ตรงกับความต้องการของคุณ โดยสามารถใส่ไอคอน รูปภาพ หรือรูปแบบต่าง ๆ ที่ต้องการได้

### ขั้นตอนการสร้าง Custom ListView

#### 1. กำหนดโครงสร้างพื้นฐานของ ListView
  - ใช้ ```ListView.builder()``` เพื่อสร้างรายการแบบไดนามิก
  - ใช้ ```ListView()``` หรือ ```Column()``` ถ้าจำนวนรายการมีน้อยและไม่เปลี่ยนแปลงบ่อย

#### 2. ออกแบบไอเทมของ ListView
  - คุณสามารถกำหนดรูปแบบไอเทมแต่ละรายการได้โดยการใช้วิดเจ็ตอย่างเช่น ```Card``` หรือ ```Container``` ร่วมกับ ```ListTile``` เพื่อทำให้รายการแต่ละอันดูมีโครงสร้างชัดเจน

#### 3. เพิ่มข้อมูลเข้าไปใน ListView
  - สามารถใช้ List หรือ Array ของข้อมูล แล้วทำการวนลูปเพื่อสร้างรายการแต่ละรายการที่แตกต่างกันได้
ตัวอย่างการสร้าง Custom ListView

#### ตัวอย่างการสร้าง Custom ListView
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom ListView Example'),
        ),
        body: CustomListView(),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  // ข้อมูลตัวอย่าง
  final List<Map<String, String>> items = [
    {'title': 'Item 1', 'subtitle': 'Subtitle 1', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Item 2', 'subtitle': 'Subtitle 2', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Item 3', 'subtitle': 'Subtitle 3', 'image': 'https://via.placeholder.com/150'},
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
```

#### คำอธิบายโค้ด
- ```ListView.builder()```: ใช้สำหรับการสร้าง ListView ที่สามารถกำหนดจำนวนรายการได้แบบไดนามิก
- ```Card``` และ ```ListTile```: ช่วยในการจัดรูปแบบแต่ละรายการ โดยใช้รูปภาพ ไตเติ้ล และข้อความย่อย
- ```Image.network()```: ดึงรูปภาพจาก URL มาแสดงในรายการ

คุณสามารถปรับแต่งเพิ่มเติม เช่น การจัดตำแหน่งไอคอน การเปลี่ยนแปลงสีพื้นหลัง หรือการเพิ่มการทำงานเพิ่มเติมในแต่ละไอเทม