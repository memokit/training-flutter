# การตั้งค่าเบื้องต้นสำหรับ Dio instance เช่นการกำหนด Base URL และ Timeout

การตั้งค่าเบื้องต้นสำหรับ Dio ใน Flutter เพื่อใช้งานการเชื่อมต่อ HTTP เช่นการกำหนด Base URL และ Timeout สามารถทำได้โดยการสร้าง Dio instance และกำหนด BaseOptions ในการตั้งค่าเริ่มต้น เช่น:

```
import 'package:dio/dio.dart';

void main() {
  // กำหนด BaseOptions สำหรับการตั้งค่าต่างๆ
  BaseOptions options = BaseOptions(
    baseUrl: 'https://api.example.com', // กำหนด Base URL
    connectTimeout: Duration(seconds: 10), // Timeout สำหรับการเชื่อมต่อ (10 วินาที)
    receiveTimeout: Duration(seconds: 20), // Timeout สำหรับการรอรับข้อมูล (20 วินาที)
  );

  // สร้าง Dio instance
  Dio dio = Dio(options);

  // สามารถใช้งาน dio ได้แล้ว เช่นการทำ HTTP request
  fetchData(dio);
}

void fetchData(Dio dio) async {
  try {
    // ตัวอย่างการทำ GET request
    var response = await dio.get('/path/to/resource');
    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
```

#### คำอธิบาย
- baseUrl: URL เริ่มต้นที่เราจะใช้ในการทำ API calls
- connectTimeout: ระยะเวลาในการรอให้การเชื่อมต่อสำเร็จ ถ้าเกินเวลาที่กำหนดจะ throw error
- receiveTimeout: ระยะเวลาในการรอรับข้อมูลหลังจากเชื่อมต่อแล้ว ถ้าเกินเวลาจะ throw error