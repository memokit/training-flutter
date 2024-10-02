# การสร้างโปรเจค

## ขั้นตอนการสร้างโปรเจค Flutter

### 1. ตรวจสอบการติดตั้ง Flutter SDK

ก่อนเริ่มต้นสร้างโปรเจค ตรวจสอบว่า Flutter ได้ติดตั้งและกำหนดค่าเสร็จเรียบร้อยแล้ว โดยใช้คำสั่ง:
```
flutter doctor
```
คำสั่งนี้จะแสดงสถานะของการติดตั้ง Flutter SDK, Android Studio, Xcode (สำหรับ macOS), และการเชื่อมต่ออุปกรณ์ต่าง ๆ

### 2. เปิด Terminal หรือ Command Prompt

เปิด Terminal (บน macOS/Linux) หรือ Command Prompt/PowerShell (บน Windows) และเข้าสู่ directory ที่คุณต้องการสร้างโปรเจค Flutter

### 3. สร้างโปรเจค Flutter

ใช้คำสั่ง ```flutter create ``` เพื่อสร้างโปรเจค Flutter ใหม่:

```
flutter create my_app
```
- ```my_app``` คือชื่อของโปรเจค คุณสามารถเปลี่ยนเป็นชื่อที่คุณต้องการได้
- หลังจากรันคำสั่งนี้ ระบบจะสร้างโครงสร้างโปรเจคทั้งหมดให้เสร็จสิ้น

### 4. เข้าสู่โฟลเดอร์โปรเจค
เมื่อการสร้างโปรเจคเสร็จสิ้นแล้ว ให้เปลี่ยนไปที่โฟลเดอร์ของโปรเจคโดยใช้คำสั่ง:

```
cd my_app
```

### 5. รันแอปพลิเคชัน Flutter
คุณสามารถรันแอป Flutter บนอุปกรณ์จำลองหรืออุปกรณ์จริงได้ โดยใช้คำสั่ง:

```
flutter run
```

### 6. การเปิดโปรเจคใน VS Code
สำหรับ Visual Studio Code ให้เปิดโปรเจคโดยใช้คำสั่งใน terminal:
```
code .
```

### 7. ลองแก้ไขและปรับแต่งโค้ด
ตอนนี้คุณสามารถเริ่มแก้ไขโค้ดที่ไฟล์ ```lib/main.dart``` ซึ่งเป็นจุดเริ่มต้นของแอป Flutter ของคุณ

```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}
```