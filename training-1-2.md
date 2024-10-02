# ทำความรู้จักกับ Widget ใน Flutter (Stateless และ Stateful Widgets)

ใน Flutter ซึ่งเป็นเฟรมเวิร์กสำหรับพัฒนาแอปพลิเคชันที่ Google พัฒนา Widget ถือเป็นหัวใจหลักของการสร้างส่วนติดต่อผู้ใช้ (User Interface) ทุกสิ่งที่เรามองเห็นบนหน้าจอแอปใน Flutter จะถูกสร้างขึ้นจาก Widget ไม่ว่าจะเป็นปุ่ม ข้อความ หรือรูปภาพ

## ประเภทของ Widget

Widget ใน Flutter แบ่งเป็นสองประเภทหลัก ได้แก่ Stateless Widget และ Stateful Widget ซึ่งมีความแตกต่างกันดังนี้:

### 1. Stateless Widget

Stateless Widget เป็น Widget ที่ไม่มีการเปลี่ยนแปลงของสถานะ (State) เมื่อมันถูกสร้างขึ้นมาแล้ว ข้อมูลภายในจะคงที่และไม่เปลี่ยนแปลงระหว่างการใช้งาน หากต้องการเปลี่ยนแปลง Widget เหล่านี้จะต้องสร้างใหม่ทั้งหมด

ตัวอย่างการใช้งาน Stateless Widget:

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
          title: Text('Stateless Widget Example'),
        ),
        body: Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}
```

ในตัวอย่างนี้ MyApp เป็น Stateless Widget ข้อความ Hello, Flutter! จะไม่เปลี่ยนแปลงเมื่อแอปทำงาน

### 2. Stateful Widget

Stateful Widget สามารถเปลี่ยนแปลงสถานะ (State) ได้ในระหว่างที่แอปทำงาน เมื่อมีการเปลี่ยนแปลงสถานะ มันจะทำการ Rebuild UI ของ Widget ใหม่ เพื่อให้แสดงผลตามสถานะปัจจุบัน

การสร้าง Stateful Widget จะต้องมีสองคลาส:

1. StatefulWidget: เป็นตัวที่ใช้กำหนด UI
2. State: ใช้เก็บสถานะและการเปลี่ยนแปลงข้อมูล

ตัวอย่างการใช้งาน Stateful Widget:

```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

ในตัวอย่างนี้ MyApp เป็น Stateful Widget เมื่อปุ่มลอย (FloatingActionButton) ถูกกด สถานะของตัวแปร _counter จะเปลี่ยนแปลงและ UI จะอัปเดตใหม่แสดงค่าที่เพิ่มขึ้น