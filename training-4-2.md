# การเริ่มต้นใช้งาน GetX

การเริ่มต้นใช้งาน GetX ใน Flutter เป็นเรื่องง่าย เพราะ GetX เป็นแพ็กเกจที่ช่วยในการจัดการสถานะ การนำทาง และการจัดการ dependencies ของแอป Flutter ได้อย่างสะดวก มาดูขั้นตอนการตั้งค่าและเริ่มต้นใช้งานกัน:

### 1. การใช้งานเบื้องต้น
#### 1.1 การจัดการสถานะ (State Management)
เราสามารถสร้าง ```Controller``` โดยการ extends GetxController เพื่อจัดการสถานะ

```
import 'package:get/get.dart';

// Controller สำหรับจัดการสถานะ
class CounterController extends GetxController {
  var count = 0.obs;  // .obs คือการบอกให้ตัวแปรนี้เป็น Observable

  void increment() {
    count++;
  }
}
```

ในหน้า UI เราจะใช้ ```GetBuilder``` หรือ ```Obx``` เพื่อฟังการเปลี่ยนแปลงของสถานะและอัปเดต UI

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';  // Import controller

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Instance ของ Controller
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GetX Example")),
        body: Center(
          child: Obx(() => Text("Count: ${controller.count}")), // UI อัปเดตตามสถานะ
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

#### 1.2 การนำทาง (Navigation)
การใช้ GetX ในการนำทางไม่จำเป็นต้องใช้ ```Navigator.of(context)``` เราสามารถใช้ ```Get.to()``` หรือ ```Get.off()``` ได้เลย

```
// ไปยังหน้าใหม่
Get.to(SecondPage());

// ลบหน้าปัจจุบันและไปยังหน้าใหม่
Get.off(SecondPage());
```

#### 1.3 การจัดการ Dependencies (Dependency Injection)
เราใช้ ```Get.put()``` สำหรับการสร้าง instance ของ controller, ```Get.lazyPut()``` สำหรับการสร้างเมื่อจำเป็น และ ```Get.find()``` เพื่อค้นหา instance ของ controller

```
// สร้าง controller เมื่อใช้ในหน้าอื่น
Get.lazyPut(() => SomeController());

// หา controller ที่ถูกสร้างไว้แล้ว
final SomeController controller = Get.find();
```

### 2. การตั้งค่า GetMaterialApp

เพื่อใช้ประโยชน์จากฟีเจอร์การนำทางของ GetX คุณต้องใช้ GetMaterialApp แทน MaterialApp ใน root ของแอปพลิเคชัน

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyHomePage(),
  ));
}
```

#### สรุป
1. ใช้ ```GetxController``` สำหรับการจัดการสถานะ
2. ใช้ ```Obx``` หรือ ```GetBuilder``` เพื่ออัปเดต UI
3. ใช้ ```Get.to()``` หรือ ```Get.off()``` สำหรับการนำทาง
4. ใช้ ```Get.put()``` และ ```Get.find()``` สำหรับ Dependency Injection
