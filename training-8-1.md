# การติดตั้ง mocktail สำหรับการ Mock ข้อมูลและทำ Unit Test 

สำหรับการติดตั้งและใช้งาน mocktail ใน Flutter เพื่อทำการ mock ข้อมูลและทำ Unit Test คุณสามารถทำตามขั้นตอนดังนี้:

#### 1. เพิ่ม dependency ของ ```mocktail```
เปิดไฟล์ ```pubspec.yaml``` และเพิ่ม dependency ของ ```mocktail```:

```
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.4
```

จากนั้นเรียกใช้คำสั่งต่อไปนี้เพื่อดาวน์โหลดแพ็กเกจ:

```
flutter pub get
```