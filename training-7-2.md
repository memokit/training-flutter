# อธิบาย 4 เลเยอร์หลัก ของ Clean Architecture

#### 1. Entities  (Domain Layer)
หน้าที่: เป็นชั้นที่เก็บโมเดลข้อมูลหลักและกฎเกณฑ์ของโดเมน (Domain Logic) โดยไม่มีการอ้างอิงถึงโครงสร้างหรือส่วนอื่นๆ ของแอปพลิเคชัน
ตัวอย่างใน Flutter: โมเดลข้อมูลหรือ class ที่เป็นตัวแทนของ business logic เช่น ```User```, ```Order```, ```Product```

#### 2. Use Cases (Application Layer)
หน้าที่: จัดการการทำงานหลักของแอปพลิเคชัน (Application Logic) เป็นจุดรวมของ business rules โดยทำงานกับ Entities เพื่อประมวลผลข้อมูลและให้ผลลัพธ์
ตัวอย่างใน Flutter: การเขียนฟังก์ชันในรูปแบบของ Use Cases เช่น FetchUserDetails, UpdateProductStatus

#### 3. Interface Adapters (Presentation Layer)
หน้าที่: ชั้นนี้จะทำหน้าที่เชื่อมต่อระหว่าง Use Cases กับ Data Layer หรือ External Services โดยใช้ Repository Pattern
ตัวอย่างใน Flutter: เราจะสร้าง repository เพื่อดึงข้อมูลจากแหล่งต่างๆ เช่น ApiRepository สำหรับการทำงานกับ API หรือ LocalStorageRepository สำหรับข้อมูลที่จัดเก็บในเครื่อง

#### 4. Frameworks & Drivers (Data Layer)
หน้าที่: จัดการข้อมูลดิบที่มาจากแหล่งต่างๆ ไม่ว่าจะเป็น API, Database หรือ local storage ชั้นนี้จะทำหน้าที่รับส่งข้อมูลกับ Interface Adapters
ตัวอย่างใน Flutter: ชั้น Data Layer อาจจะประกอบด้วยการเชื่อมต่อกับ Firebase, REST API หรือ SQLite