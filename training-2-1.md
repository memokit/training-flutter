
# การสร้างรายการข้อมูลแบบ Scroll ด้วย ListView

ในการสร้างรายการข้อมูลแบบ Scroll ด้วย ListView ใน Flutter คุณสามารถใช้งาน ListView ได้หลายรูปแบบ เช่น การแสดงรายการข้อมูลที่มีจำนวนจำกัดหรือไม่จำกัด และยังสามารถใช้ร่วมกับ Widget อื่นๆ ได้ตามที่ต้องการ

### ตัวอย่างการสร้าง ListView

#### 1. ```ListView``` แบบธรรมดา:

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
        appBar: AppBar(title: Text("ListView Example")),
        body: ListView(
          children: <Widget>[
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
    );
  }
}
```

ในโค้ดนี้ เราใช้ ```ListView``` เพื่อแสดง ```ListTile``` ซึ่งเป็นรายการพื้นฐานใน Flutter ที่มีไอคอนและข้อความ

#### 2. ```ListView.builder``` สำหรับรายการจำนวนมาก:
หากคุณมีข้อมูลจำนวนมากและไม่ต้องการโหลดทุกรายการพร้อมกัน คุณสามารถใช้ ```ListView.builder``` เพื่อโหลดรายการตามความจำเป็น

```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List<String>.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView.builder Example")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.label),
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
```

ในโค้ดนี้ ```ListView.builder``` จะสร้างรายการเมื่อจำเป็นเท่านั้น ทำให้ประหยัดหน่วยความจำมากขึ้นเมื่อแสดงรายการจำนวนมาก

#### 3. ```ListView.separated``` สำหรับรายการที่มีตัวแบ่ง (Divider)
หากต้องการแสดงรายการโดยมีตัวแบ่งระหว่างรายการ คุณสามารถใช้ ```ListView.separated```

```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List<String>.generate(30, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView.separated Example")),
        body: ListView.separated(
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
    );
  }
}
```

ในโค้ดนี้ ```ListView.separated``` จะสร้างตัวแบ่ง (```Divider```) ระหว่างแต่ละรายการ

#### สรุป
```ListView``` เป็น widget ที่ใช้แสดงรายการที่ Scroll ใน Flutter
คุณสามารถใช้งานได้หลายรูปแบบ เช่น ```ListView.builder``` และ ```ListView.separated``` เพื่อเพิ่มประสิทธิภาพหรือการปรับแต่งตามที่ต้องการ