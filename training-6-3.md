#  การทำงานด้วย GET, POST, PUT, DELETE Requests ด้วย Dio

การทำงานของ Dio ใน Flutter เป็นเรื่องของการส่งคำร้องขอ (requests) HTTP แบบต่าง ๆ เช่น ```GET```, ```POST```, ```PUT```, และ ```DELETE``` เพื่อทำงานกับ API หรือเซิร์ฟเวอร์ โดย Dio เป็น package ยอดนิยมที่ใช้สำหรับการจัดการ HTTP requests และรองรับการทำงานที่ยืดหยุ่นมากมาย เช่น timeout, interceptors, และการจัดการ response อย่างละเอียด

### การใช้งาน Dio ใน Requests ต่าง ๆ

#### 1. การสร้าง Dio instance

ก่อนที่จะทำการ request ใด ๆ เราต้องสร้าง instance ของ Dio

```
import 'package:dio/dio.dart';

Dio dio = Dio();
```

#### 2. GET Request
การดึงข้อมูลจาก API สามารถทำได้ด้วย GET request:

```
try {
  Response response = await dio.get('https://example.com/users');
  print(response.data);
} catch (e) {
  print(e);
}
```

#### 3. POST Request
การส่งข้อมูลไปยัง API สามารถทำได้ด้วย POST request โดยส่งข้อมูลในรูปแบบ JSON:

```
try {
  Response response = await dio.post('https://example.com/users', data: {
    'name': 'John',
    'age': 25
  });
  print(response.data);
} catch (e) {
  print(e);
}
```

#### 4. PUT Request
ใช้สำหรับการอัปเดตข้อมูลที่มีอยู่:

```
try {
  Response response = await dio.put('https://example.com/users/1', data: {
    'name': 'John',
    'age': 30
  });
  print(response.data);
} catch (e) {
  print(e);
}
```

#### 5. DELETE Request
ใช้สำหรับลบข้อมูล:

```
try {
  Response response = await dio.delete('https://example.com/users/1');
  print(response.data);
} catch (e) {
  print(e);
}
```

### การตั้งค่าเพิ่มเติม

#### 1. Timeout
สามารถตั้งเวลา timeout ให้กับ request ได้:

```
dio.options.connectTimeout = Duration(seconds: 10);
dio.options.receiveTimeout = Duration(seconds: 10);
```

#### 2. Headers
การกำหนด headers ให้กับ request:

```
dio.options.headers = {
  'Authorization': 'Bearer YOUR_TOKEN',
  'Content-Type': 'application/json',
};
```

#### 3. Interceptors
Interceptors ช่วยให้เราสามารถจัดการกับ request/response ก่อนที่จะส่งออกหรือรับเข้ามาได้:

```
dio.interceptors.add(InterceptorsWrapper(
  onRequest: (options, handler) {
    print("Sending request to ${options.path}");
    return handler.next(options);
  },
  onResponse: (response, handler) {
    print("Response received: ${response.data}");
    return handler.next(response);
  },
  onError: (DioError e, handler) {
    print("Error occurred: $e");
    return handler.next(e);
  },
));
```