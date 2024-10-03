# การแสดงไอคอนในแอปด้วย Icon และ ImageIcon


ใน Flutter การแสดงไอคอนในแอปสามารถทำได้โดยใช้ทั้ง ```Icon``` และ ```ImageIcon``` โดยมีความแตกต่างในวิธีการใช้งานเล็กน้อย ดังนี้:

#### 1. การใช้ Icon
```Icon``` ใช้สำหรับแสดงไอคอนที่มาจากไอคอนฟอนต์ เช่น ```Icons``` ที่เป็นไอคอนในตัวของ Flutter เอง

```
Icon(
  Icons.favorite,  // เลือกไอคอนจากไอคอนที่มีอยู่ในตัว Flutter
  color: Colors.red,  // กำหนดสี
  size: 30.0,  // กำหนดขนาด
)
```
ไอคอนที่ใช้ได้ใน ```Icons```
Flutter มีชุดไอคอนให้ใช้งานโดยเรียกจาก ```Icons``` เช่น ```Icons.home```, ```Icons.search```, ```Icons.favorite``` และอื่น ๆ

#### 2. การใช้ ImageIcon
```ImageIcon``` ใช้สำหรับการแสดงผลไอคอนจากไฟล์รูปภาพ (เช่น ```.png```, ```.jpg```) แทนการใช้ไอคอนที่เป็นฟอนต์

```
ImageIcon(
  AssetImage('assets/images/cat.jpg'),  // ไฟล์รูปที่ใช้เป็นไอคอน
  color: Colors.blue,  // กำหนดสี
  size: 30.0,  // กำหนดขนาด
)
```

#### การเพิ่มโฟลเดอร์ icons ในโปรเจค
1. สร้างโฟลเดอร์ assets/icons และใส่ไฟล์รูปภาพที่ต้องการใช้เป็นไอคอนลงไป
2. เพิ่ม assets ในไฟล์ ```pubspec.yaml```:

```
flutter:
  assets:
    - assets/images/
    - assets/icons/
```

#### ความแตกต่าง:
```Icon```: ใช้กับไอคอนที่เป็นฟอนต์ในตัวของ Flutter ซึ่งมีขนาดเล็กและไม่จำเป็นต้องโหลดจากไฟล์
```ImageIcon```: ใช้กับไอคอนที่เป็นรูปภาพที่คุณกำหนดเอง

#### ตัวอย่างการใช้งานร่วมกัน:

```
Column(
  children: <Widget>[
    Icon(
      Icons.home,
      color: Colors.green,
      size: 40.0,
    ),
    ImageIcon(
      AssetImage('assets/images/cat.jpg'),
      color: Colors.blue,
      size: 40.0,
    ),
  ],
)
```
