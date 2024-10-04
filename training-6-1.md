# การติดตั้ง Dio ผ่าน pubspec.yaml

#### ในการติดตั้ง ```Dio``` บน Flutter ผ่านไฟล์ ```pubspec.yaml``` คุณสามารถทำได้ตามขั้นตอนดังนี้:

1. เปิดไฟล์ ```pubspec.yaml``` ของโปรเจกต์ Flutter ของคุณ
2. ไปที่ส่วน ```dependencies```
3. เพิ่ม Dio โดยใส่ dependency ดังนี้:

```
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0
```

4. หลังจากเพิ่มใน pubspec.yaml แล้ว ให้รันคำสั่งนี้ใน terminal เพื่ออัปเดต dependencies:

```
flutter pub get
```

หากคุณต้องการดูรายละเอียดเพิ่มเติมเกี่ยวกับ Dio หรือแพ็กเกจอื่น ๆ บน pub.dev