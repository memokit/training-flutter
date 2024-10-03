# การสร้าง Controller ใน GetX เพื่อจัดการ State

ในการสร้าง Controller ใน GetX ของ Flutter เพื่อจัดการ State คุณสามารถทำได้โดยการสร้างคลาสที่สืบทอดจาก ```GetxController``` และใช้วิธีการในการจัดการ State ดังนี้:

#### 1. สร้าง Controller: สร้างคลาสที่สืบทอดจาก GetxController เพื่อใช้ในการจัดการ State

```
import 'package:get/get.dart';

class CounterController extends GetxController {
  // กำหนดตัวแปร State โดยใช้ Rx (Reactive)
  var count = 0.obs;

  // ฟังก์ชันในการเพิ่มค่า count
  void increment() {
    count++;
  }
}
```

#### 2. เชื่อม Controller กับ UI: ในส่วน UI ของแอป ให้เชื่อมต่อ Controller กับ Widget โดยใช้ ```GetBuilder``` หรือ ```Obx``` เพื่ออัปเดต UI อัตโนมัติเมื่อ State เปลี่ยน

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart'; // นำเข้าตัว Controller

class CounterPage extends StatelessWidget {
  // สร้าง instance ของ Controller
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter')),
      body: Center(
        // ใช้ Obx ในการอัปเดต UI เมื่อ State เปลี่ยน
        child: Obx(() => Text('Count: ${counterController.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment, // เรียกใช้ฟังก์ชันใน Controller
        child: Icon(Icons.add),
      ),
    );
  }
}
```

#### คำอธิบาย:
- Controller: ใช้ในการจัดการ logic ของแอปและจัดการ State โดยไม่ต้องผูกติดกับ UI โดยตรง
- Get.put(): ใช้ในการสร้างและจัดการการเชื่อมต่อระหว่าง Controller กับ UI โดย Get จะทำการเก็บ Controller ไว้ให้เรา
- Obx(): เป็น Widget ที่ใช้ในการ observe การเปลี่ยนแปลงของ State และอัปเดต UI ทันทีที่ State มีการเปลี่ยนแปลง
- obs: เป็นตัวทำให้ตัวแปรสามารถถูก observe ได้ในลักษณะ Reactive (Rx)
