# การใช้ Obx, GetBuilder, GetX และ StateMixin สำหรับการแสดงผล UI ที่เชื่อมโยงกับ State

ใน GetX มีหลายวิธีในการแสดงผล UI ที่เชื่อมโยงกับ State ได้แก่ Obx, GetBuilder, GetX และ StateMixin ทั้งสามมีวิธีการทำงานที่แตกต่างกันในการอัปเดต UI เมื่อ State เปลี่ยนแปลง

#### 1. Obx

```Obx``` เป็น Widget ที่ใช้เพื่อฟังการเปลี่ยนแปลงของ Reactive Variables (Rx variables) และจะ rebuild UI โดยอัตโนมัติเมื่อมีการเปลี่ยนแปลงในค่าเหล่านั้น

ตัวอย่างการใช้งาน:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class MyHomePage extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Obx Example')),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

#### 2. GetBuilder
```GetBuilder``` เป็นอีกทางเลือกหนึ่งในการจัดการ State โดยการใช้ update เพื่อรีเฟรช UI ตัวอย่างการใช้งาน:

```
class CounterController extends GetxController {
  var count = 0; // ใช้ตัวแปรปกติ

  void increment() {
    count++;
    update(); // เรียกใช้ update เพื่อรีเฟรช UI
  }
}

class CounterPage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetBuilder Example")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller) => Text("Count: ${controller.count}"), // UI จะรีเฟรชเมื่อ update ถูกเรียก
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

#### 3. GetX
```GetX``` เป็นอีกวิธีหนึ่งในการใช้งานที่ให้ UI ทำการรีเฟรชอัตโนมัติเมื่อตัวแปรเปลี่ยนแปลง ตัวอย่าง:

```
class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class CounterPage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Example")),
      body: Center(
        child: GetX<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Text("Count: ${controller.count}");
          },
        ), // UI จะรีเฟรชเมื่อ count เปลี่ยน
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

#### 4. StateMixin
```StateMixin``` ใช้สำหรับการจัดการสถานะที่มีหลายสถานะ (เช่น loading, error, success) ตัวอย่าง:

```
class MyController extends GetxController with StateMixin<List<String>> {
  void fetchData() {
    change([], status: RxStatus.loading()); // เปลี่ยนสถานะเป็น loading

    // สมมุติว่าโหลดข้อมูลจาก API
    Future.delayed(Duration(seconds: 2), () {
      change(['Data 1', 'Data 2'], status: RxStatus.success()); // เปลี่ยนสถานะเป็น success
    });
  }
}

class DataPage extends StatelessWidget {
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    controller.fetchData(); // เรียกใช้งานเมื่อ UI สร้าง

    return Scaffold(
      appBar: AppBar(title: Text("StateMixin Example")),
      body: controller.obx(
        (data) => ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) => ListTile(title: Text(data![index])),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // แสดง Loading
        onError: (error) => Center(child: Text("Error: $error")), // แสดง Error
      ),
    );
  }
}
```