# การใช้งาน Named Routes

การใช้งาน Named Routes ใน Flutter ร่วมกับ GetX ช่วยให้การจัดการเส้นทาง (routes) ระหว่างหน้าในแอปพลิเคชันมีความสะดวกขึ้นมาก โดยคุณสามารถจัดการเส้นทางของหน้าได้ด้วยชื่อ (Name) แทนการใช้ตัวแปรประเภท Widget ตรงๆ ซึ่งจะทำให้โค้ดของคุณดูเป็นระเบียบมากขึ้น และง่ายต่อการบำรุงรักษา

#### 1. สร้างหน้า (Pages)
ให้คุณสร้างไฟล์สำหรับแต่ละหน้าที่ต้องการใช้ในแอป ตัวอย่างเช่น ```RouteNamePage``` และ ```RouteName2Page``` ดังนี้:

```
// route_name_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteNamePage extends StatelessWidget {
  const RouteNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Route Name Example'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              Text(
                "Hello Route Name!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed('/routeName2Page');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 2'),
              ),
            ],
          ),
        ));
  }
}
```

```
// route_name_2_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteName2Page extends StatelessWidget {
  const RouteName2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Route Name Example'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              Text(
                "Hello Route Name 2!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ));
  }
}

```

#### 2. การกำหนด Named Routes
ในไฟล์ ```main.dart``` ให้ทำการกำหนด Named Routes ในรูปแบบของ GetPage ดังนี้:

```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Named Routes',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => RouteNamePage()),
        GetPage(name: '/routeName2Page', page: () => RouteName2Page()),
      ],
    );
  }
}
```

#### 3. เรียกใช้งาน Named Routes
ในหน้าที่คุณต้องการเปลี่ยนไปหน้าอื่น ให้เรียกใช้ ```Get.toNamed('/route_name')``` เช่นในตัวอย่าง ```RouteNamePage``` ที่ได้เรียกไปยัง ```/routeName2Page```:

```
OutlinedButton(
  onPressed: () {
    Get.toNamed('/routeName2Page');
  },
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.red,
    side: const BorderSide(color: Colors.red, width: 2),
    padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  child: const Text('Go to Page 2'),
),
```

#### 4. การใช้งานเพิ่มเติม
- ย้อนกลับไปหน้าเดิม: ```Get.back();```
- แทนที่หน้าเดิม: ```Get.offNamed('/second');``` จะทำการเปลี่ยนหน้าใหม่และลบหน้าเดิมออกจาก stack
- ลบทุกหน้าแล้วไปยังหน้าใหม่: ```Get.offAllNamed('/second');```