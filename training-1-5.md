#  การใช้ การใช้งานปุ่ม (Button Widgets): TextButton, ElevatedButton, OutlinedButton, IconButton

ใน Flutter มีปุ่มหลายประเภทที่สามารถใช้งานได้ โดยแต่ละแบบจะมีลักษณะการใช้งานที่แตกต่างกันไป รวมถึงความสามารถในการปรับแต่งตามต้องการ เช่น การเปลี่ยนสี, ขอบ, หรือไอคอนประกอบ เรามาดูปุ่มแต่ละแบบกัน:

### 1. TextButton
```TextButton``` เป็นปุ่มที่ไม่มีขอบหรือพื้นหลัง มักถูกใช้ในกรณีที่ต้องการให้ผู้ใช้ทำการเลือกตัวเลือกโดยที่ไม่เน้นน้ำหนักการเลือกมาก เช่น ลิงก์ข้อความ

ตัวอย่างการใช้งาน:

```
TextButton(
  onPressed: () {
    print('TextButton pressed');
  },
  child: Text('Click Me'),
)
```

#### คุณสมบัติที่ปรับแต่งได้:

- ```style```: ปรับแต่งลักษณะของปุ่ม เช่น สีพื้นหลัง, ขนาด, ขอบ, หรืออื่นๆ

```
TextButton(
  onPressed: () {},
  child: Text('Click Me'),
  style: TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    padding: EdgeInsets.all(16.0),
  ),
)
```

### 2. ElevatedButton
```ElevatedButton``` เป็นปุ่มที่มีพื้นหลังและมีเอฟเฟกต์ยกขึ้น มักใช้ในกรณีที่ต้องการให้ปุ่มเด่นหรือเน้นการกระทำที่สำคัญ

ตัวอย่างการใช้งาน:

```
ElevatedButton(
  onPressed: () {
    print('ElevatedButton pressed');
  },
  child: Text('Click Me'),
)
```

#### คุณสมบัติที่ปรับแต่งได้:

- ```style```: ปรับแต่งสีพื้นหลัง, รูปทรง, ขอบ, หรือเงา

```
ElevatedButton(
  onPressed: () {},
  child: Text('Click Me'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
)
```

### 3. OutlinedButton
```OutlinedButton``` เป็นปุ่มที่มีเส้นขอบแต่ไม่มีพื้นหลัง มักถูกใช้ในกรณีที่ต้องการให้ปุ่มมีน้ำหนักเบา แต่ยังคงมีขอบที่แสดงความเป็นปุ่ม

ตัวอย่างการใช้งาน:

```
OutlinedButton(
  onPressed: () {
    print('OutlinedButton pressed');
  },
  child: Text('Click Me'),
)
```

#### คุณสมบัติที่ปรับแต่งได้:

- ```style```: ปรับแต่งขอบ, สีข้อความ, ขนาด หรืออื่นๆ

```
OutlinedButton(
  onPressed: () {},
  child: Text('Click Me'),
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.red,
    side: BorderSide(color: Colors.red, width: 2),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
)
```

### 4. IconButton
```IconButton``` เป็นปุ่มที่ใช้ไอคอนแทนข้อความ และสามารถใช้สำหรับการกระทำที่รวดเร็ว เช่น ปุ่มย้อนกลับหรือปุ่มแชร์

ตัวอย่างการใช้งาน:

```
IconButton(
  icon: Icon(Icons.thumb_up),
  onPressed: () {
    print('IconButton pressed');
  },
)
```

#### คุณสมบัติที่ปรับแต่งได้:

- ```iconSize```: ขนาดของไอคอน
- ```color```: สีของไอคอน
- ```tooltip```: คำอธิบายปุ่ม (จะเห็นเมื่อวางเมาส์ค้างไว้)

```
IconButton(
  icon: Icon(Icons.thumb_up),
  iconSize: 30.0,
  color: Colors.blue,
  tooltip: 'Like',
  onPressed: () {},
)
```

### สรุป:
- ```TextButton```: ใช้สำหรับการกระทำที่ไม่ต้องการการเน้นมาก (ปุ่มแบบข้อความ)
- ```ElevatedButton```: ใช้สำหรับการกระทำที่ต้องการให้เด่นขึ้น (ปุ่มที่มีพื้นหลัง)
- ```OutlinedButton```: ปุ่มที่มีเส้นขอบแต่ไม่มีพื้นหลัง
- ```IconButton```: ปุ่มที่ใช้ไอคอนแทนข้อความ