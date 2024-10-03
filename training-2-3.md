
# การจัดการการแสดงข้อมูลหลายคอลัมน์ด้วย GridView

ใน Flutter ถ้าต้องการแสดงข้อมูลในรูปแบบหลายคอลัมน์ เราสามารถใช้ ```GridView``` ซึ่งเป็น Widget ที่ช่วยในการจัดเรียงข้อมูลให้อยู่ในรูปแบบตาราง (grid) ได้สะดวกมาก โดยมีตัวเลือกหลายแบบให้เลือกใช้ขึ้นอยู่กับความต้องการ เช่น ```GridView.count``` หรือ ```GridView.builder``` เป็นต้น

### 1. ใช้ ```GridView.count```
การใช้ ```GridView.count``` จะช่วยให้เราสามารถกำหนดจำนวนคอลัมน์ที่ต้องการได้โดยตรง

```
import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
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

void main() => runApp(MaterialApp(home: GridViewExample()));
```

ในตัวอย่างนี้ ```GridView.count``` จะจัดให้ข้อมูลในแต่ละบล็อกอยู่ในตารางที่มี 2 คอลัมน์

### 2. ใช้ ```GridView.builder```
ถ้าต้องการควบคุมการสร้างรายการทีละตัว หรือมีข้อมูลจำนวนมากที่ต้องแสดง สามารถใช้ ```GridView.builder``` แทน ซึ่งมีประสิทธิภาพกว่าเมื่อข้อมูลมีจำนวนมาก

```
import 'package:flutter/material.dart';

class GridViewBuilderExample extends StatelessWidget {
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

void main() => runApp(MaterialApp(home: GridViewBuilderExample()));
```

ในตัวอย่างนี้ ```GridView.builder``` ช่วยให้การสร้างรายการมีประสิทธิภาพมากขึ้นและสามารถจัดการข้อมูลจำนวนมากได้ง่าย