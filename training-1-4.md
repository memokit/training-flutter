#  การใช้ Layout Widgets: Container, Column, Row


ใน Flutter การใช้งาน Layout Widgets เป็นสิ่งสำคัญในการสร้าง UI ที่สามารถจัดวางองค์ประกอบต่างๆ ได้อย่างมีประสิทธิภาพ โดย Layout Widgets ที่สำคัญ เช่น Container, Column และ Row มีบทบาทดังนี้:

### 1. Container

```Container``` เป็น widget ที่ใช้ในการจัดรูปแบบ หรือปรับขนาดของ child widget รวมถึงการจัดการเรื่อง padding, margin, alignment, border, และอื่นๆ ได้อย่างยืดหยุ่น

```
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text('Hello Flutter!'),
)
```

#### คุณสมบัติที่สำคัญ:

- width และ height: กำหนดขนาดของ Container
- padding: ระยะห่างภายในจากขอบของ Container
- margin: ระยะห่างภายนอกจากองค์ประกอบอื่น
- color: สีพื้นหลังของ Container

### 2. Column

```Column``` เป็น widget ที่ใช้ในการจัดวาง child widgets ในแนวตั้ง (จากบนลงล่าง)

โค้ดตัวอย่าง:

```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Text 1'),
    Text('Text 2'),
    Text('Text 3'),
  ],
)
```

#### คุณสมบัติที่สำคัญ:

- mainAxisAlignment: จัดแนว child widgets ในแกนหลัก (แนวตั้ง)
- crossAxisAlignment: จัดแนวในแกนรอง (แนวนอน)

### 3. Row

Row เป็น widget ที่ใช้ในการจัดวาง child widgets ในแนวนอน (จากซ้ายไปขวา)

โค้ดตัวอย่าง:

```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
)
```

#### คุณสมบัติที่สำคัญ:

- mainAxisAlignment: จัดแนว child widgets ในแกนหลัก (แนวนอน)
- crossAxisAlignment: จัดแนวในแกนรอง (แนวตั้ง)

### การใช้ร่วมกัน:

```Container```, ```Column```, และ ```Row``` มักถูกใช้ร่วมกันเพื่อสร้าง layout ที่ซับซ้อนขึ้น โดยสามารถใส่ widget หนึ่งภายในอีก widget หนึ่งได้

โค้ดตัวอย่างการใช้ร่วมกัน:

```
Scaffold(
    appBar: AppBar(
        title: Text('Layout Widgets Example'),
    ),
    body: Container(
    padding: const EdgeInsets.all(10),
    child: const Column(
        children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Icon(Icons.home),
            Icon(Icons.settings),
            ],
        ),
        Text('Welcome to Flutter!'),
        ],
    ),
    ),
)
```