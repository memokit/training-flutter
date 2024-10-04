# การเพิ่ม GetX ใน pubspec.yaml

#### ในการเพิ่ม GetX ในโปรเจกต์ Flutter ของคุณ คุณสามารถทำตามขั้นตอนต่อไปนี้:

1. เปิดไฟล์ ```pubspec.yaml``` ของโปรเจกต์ Flutter ของคุณ
2. ไปที่ส่วน ```dependencies```
3. เพิ่ม GetX โดยใส่ dependency ดังนี้:

```
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6 # ใส่เวอร์ชันที่ต้องการ หรือใช้เวอร์ชันล่าสุด
```

4. หลังจากเพิ่มใน pubspec.yaml แล้ว ให้รันคำสั่งนี้ใน terminal เพื่ออัปเดต dependencies:

```
flutter pub get
```

หากคุณต้องการดูรายละเอียดเพิ่มเติมเกี่ยวกับ GetX หรือแพ็กเกจอื่น ๆ บน pub.dev