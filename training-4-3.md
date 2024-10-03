# การเปลี่ยนหน้าจอด้วย ```Get.to()```, ```Get.off()```, ```Get.offAll()```, และ ```Get.back()```

ใน Flutter เมื่อใช้ GetX เราสามารถจัดการการเปลี่ยนหน้าจอด้วยฟังก์ชันต่าง ๆ ได้อย่างสะดวก โดยที่ไม่จำเป็นต้องใช้ ```Navigator.push``` หรือ ```Navigator.pop``` แบบเดิม ๆ นี่คือตัวอย่างการใช้งาน ```Get.to()```, ```Get.off()```, ```Get.offAll()```, และ ```Get.back()```:

#### 1. ```Get.to()```
ใช้เพื่อเปลี่ยนไปยังหน้าจอใหม่ (เหมือนกับ ```Navigator.push()```) โดยหน้าจอเดิมจะยังคงอยู่ใน stack สามารถกลับมาหน้าจอก่อนหน้าได้โดยใช้ ```Get.back()``` หรือ ```Navigator.pop()```

```
Get.to(NewScreen());
```

#### 2. ```Get.off()```

ใช้เพื่อเปลี่ยนไปยังหน้าจอใหม่และลบหน้าจอเดิมออกจาก stack (เหมือนกับ ```Navigator.pushReplacement()```) ซึ่งไม่สามารถกลับไปหน้าจอก่อนหน้าได้อีก

```
Get.off(NewScreen());
```

#### 3. ```Get.offAll()```

ใช้เพื่อเปลี่ยนไปยังหน้าจอใหม่พร้อมกับลบหน้าจอทั้งหมดที่อยู่ใน stack ออก (เหมือนกับ ```Navigator.pushAndRemoveUntil()```) ซึ่งหมายความว่าหลังจากใช้คำสั่งนี้แล้วจะไม่สามารถกลับไปหน้าจอก่อนหน้าได้อีก เพราะหน้าจอทั้งหมดถูกลบออกไปแล้ว

```
Get.offAll(NewScreen());
```

#### 4. Get.back()
ใช้เพื่อกลับไปหน้าจอก่อนหน้า (เหมือนกับ ```Navigator.pop()```)

```
Get.back();
```

#### ตัวอย่างการใช้งานทั้งหมด

```
Scaffold(
    appBar: AppBar(
        title: Text('Navigator Example'),
    ),
    body: Container(
        width: Get.width,
        child: Column(
            children: [
            Text(
                "Hello Navigator!",
                style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                    Get.to(() => const Navigator1Page());
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 1'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                    Get.to(() => const Navigator2Page());
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 2'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                    Get.to(() => const Navigator3Page());
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Go to Page 3'),
            ),
            ],
        ),
));
```