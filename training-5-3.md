# จัดการ Dependencies Get.put(), Get.lazyPut() และ Get.find()

ใน Flutter ด้วยการใช้ GetX คุณสามารถจัดการ Dependencies ได้อย่างมีประสิทธิภาพโดยใช้ ```Get.put()```, ```Get.lazyPut()```, และ ```Get.find()```. นี่คือคำอธิบายแต่ละฟังก์ชัน:

#### 1. Get.put()
- ใช้เมื่อคุณต้องการสร้าง instance ของ class และให้มันอยู่ใน memory ตลอดเวลา
- เหมาะสมสำหรับ controller หรือ service ที่คุณรู้ว่าจะต้องใช้ตลอดทั้ง lifecycle ของแอป
- วิธีการใช้งาน:

```
Get.put(YourController());
```

- ตัวอย่าง:

```
class YourController extends GetxController {
  // your controller logic
}

void main() {
  // Put your controller in memory
  Get.put(YourController());
}
```

#### 2. Get.lazyPut()
- ใช้เมื่อคุณต้องการให้ instance ถูกสร้างเมื่อมีการเรียกใช้งานครั้งแรกเท่านั้น (Lazy Loading)
- เหมาะสมสำหรับ controller หรือ service ที่อาจจะไม่ถูกใช้ทุกครั้งที่แอปทำงาน หรือมีการใช้ resource มาก
- วิธีการใช้งาน:

```
Get.lazyPut<YourController>(() => YourController());
```

- ตัวอย่าง:

```
class YourController extends GetxController {
  // your controller logic
}

void main() {
  // Lazy load your controller
  Get.lazyPut<YourController>(() => YourController());
}
```

#### 3. Get.find()
- ใช้เพื่อค้นหา instance ที่ถูกจัดการไว้ใน memory
- วิธีการใช้งาน:

```
YourController controller = Get.find<YourController>();
```

- ตัวอย่าง:

```
void someFunction() {
  final YourController controller = Get.find<YourController>();

}
```

#### สรุป
- Get.put(): ใช้สำหรับสร้าง instance และเก็บไว้ใน memory ทันที
- Get.lazyPut(): ใช้สำหรับสร้าง instance เมื่อมีการเรียกใช้งานครั้งแรกเท่านั้น
- Get.find(): ใช้ค้นหา instance ที่ถูกจัดการไว้ใน memory