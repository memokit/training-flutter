# การส่งข้อมูลระหว่างหน้า (Passing Data between Routes)

การส่งข้อมูลระหว่างหน้าด้วย Flutter GetX ทำได้ง่ายมาก โดยใช้ฟีเจอร์ของ GetX ที่มีประสิทธิภาพในการจัดการเส้นทาง (Routes) และการส่งข้อมูลผ่านเส้นทางต่างๆ ในแอป โดยปกติแล้วจะใช้ ```Get.to()```  หรือ ```Get.toNamed()``` สำหรับการนำทางไปยังหน้าใหม่ และสามารถส่งข้อมูลไปด้วยได้ผ่าน argument

#### ขั้นตอนการส่งข้อมูลระหว่างหน้าใน Flutter GetX
1. สร้างหน้า (Screens)
สมมติว่าคุณมีสองหน้า คือ หน้าแรก (ArgumentFirstPage) และ หน้าที่สอง (ArgumentSecondPage) และต้องการส่งข้อมูลจากหน้าแรกไปยังหน้าที่สอง

#### argument_first_page.dart

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentFirstPage extends StatelessWidget {
  const ArgumentFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Argument Example'),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          children: [
            Text(
              "Hello Argument Page",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Get.toNamed('/argumentSecondPage', arguments: {
                  "name": "Indy",
                });
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
      ),
    );
  }
}
```


#### argument_second_page.dart

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentSecondPage extends StatelessWidget {
  ArgumentSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
     // รับข้อมูลที่ส่งมาจาก ArgumentFirstPage
    final String name = Get.arguments["name"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Argument Example'),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          children: [
            Text(
              "Hello Argument Name! $name",
              style: Theme.of(context).textTheme.headlineSmall,
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
      ),
    );
  }
}
```

#### 2. การใช้ Get.arguments เพื่อรับข้อมูล
ในหน้า ArgumentSecondPage เราใช้ Get.arguments เพื่อดึงข้อมูลที่ส่งมาจากหน้าแรก (ในที่นี้คือข้อความ "Indy") ซึ่งจะสามารถแสดงผลบนหน้าที่สองได้ทันที

#### 3. การกำหนดเส้นทาง (Routing)
หากคุณต้องการกำหนดเส้นทางในแอปแบบ Global Routes สามารถทำได้โดยการกำหนด routing ในไฟล์ GetMaterialApp ดังนี้:

#### main.dart
```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Named Routes',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ArgumentFirstPage()),
        GetPage(name: '/argumentSecondPage', page: () => ArgumentSecondPage()),
      ],
    );
  }
}
```