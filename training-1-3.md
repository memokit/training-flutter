#  การใช้ Scaffold Widget

ใน Flutter, ```Scaffold``` เป็น widget ที่มีบทบาทสำคัญในการสร้างโครงสร้างหลักของแอปพลิเคชัน เช่น การจัดการแถบ AppBar, BottomNavigationBar, Drawer และการแสดงเนื้อหาหลักของหน้าจอ ทำให้การพัฒนา UI เป็นไปได้ง่ายและเป็นมาตรฐานมากขึ้น

### โครงสร้างของ Scaffold

```Scaffold``` มักถูกใช้เป็นโครงสร้างพื้นฐานในทุกหน้าของแอปพลิเคชัน Flutter ช่วยให้สามารถจัดการส่วนประกอบที่สำคัญได้ง่ายขึ้น

โค้ดตัวอย่าง:

```
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
  ),
  body: Center(
    child: Text('Hello, Flutter!'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Action เมื่อกดปุ่ม
    },
    child: Icon(Icons.add),
  ),
)
```

### ส่วนประกอบหลักของ Scaffold:
```appBar```: เป็นแถบด้านบนของหน้าจอ ใช้สำหรับแสดงชื่อแอปหรือเครื่องมือต่างๆ
- ตัวอย่างเช่น AppBar, ใช้ในการแสดง title, icon, และ action buttons

```body```: เป็นส่วนหลักของหน้าจอ ใช้ในการแสดงเนื้อหาหลักของหน้า เช่น widgets ต่างๆ ที่จะแสดงบนหน้าจอ
- เช่น การแสดงข้อความ, รูปภาพ หรือองค์ประกอบต่างๆ ในแอป

```floatingActionButton```: เป็นปุ่มลอยที่อยู่เหนือหน้าจอ ใช้สำหรับแอคชันหลักในหน้านั้นๆ
- ตัวอย่างเช่น ปุ่มที่กดเพื่อเพิ่มข้อมูล หรือปุ่มที่ใช้ส่งคำสั่ง

```drawer```: เป็นเมนูแบบเลื่อนออกมาจากด้านข้างของหน้าจอ ใช้สำหรับการแสดงรายการเมนู (เช่น เมนูการตั้งค่า)
- ตัวอย่างเช่น Drawer, สามารถเลื่อนจากด้านซ้ายหรือขวาของหน้าจอ

```bottomNavigationBar```: เป็นแถบนำทางด้านล่างหน้าจอ ใช้สำหรับการเปลี่ยนหน้าหรือส่วนต่างๆ ในแอป
- ตัวอย่างเช่น เมนูนำทางระหว่างหน้าในแอปแบบ Tab

```backgroundColor```: กำหนดสีพื้นหลังของหน้าจอ

### โค้ดตัวอย่างการใช้ส่วนประกอบต่างๆ ใน Scaffold:

```
Scaffold(
    appBar: AppBar(
        title: const Text('Scaffold Example'),
    ),
    body: const Center(
        child: Text('Hello, Scaffold!'),
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
    ),
    drawer: Drawer(
        child: ListView(
            children: <Widget>[
                const DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                    ),
                    child: Text('Menu'),
                ),
                ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                    // Perform action
                    },
                ),
            ],
        ),
    ),
    bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
            ),
        ],
        currentIndex: 0,
        onTap: (index) {
            // Handle navigation
        },
    ),
);
```