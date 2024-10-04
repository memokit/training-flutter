#  การส่ง Query Parameters, Body Data และ Headers ใน Dio

#### 1. การส่งแบบ Query Parameters

```
import 'package:dio/dio.dart';

void sendGetWithQueryParams() async {
  Dio dio = Dio();

  // Query Parameters ที่จะถูกส่งไปกับ URL
  Map<String, dynamic> queryParams = {
    'search': 'Flutter',
    'page': 1,
  };

  try {
    // ส่ง GET request พร้อม Query Parameters
    Response response = await dio.get(
      'https://api.example.com/items',
      queryParameters: queryParams, // ส่ง query parameters
    );

    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
```

ในตัวอย่างนี้จะได้ URL เป็น ```https://api.example.com/items?search=Flutter&page=1```

#### 2. การส่งแบบ Body Data (เช่นใน POST Request)
```
import 'package:dio/dio.dart';

void sendPostWithBody() async {
  Dio dio = Dio();

  // ข้อมูล Body ที่จะส่ง
  Map<String, dynamic> data = {
    'title': 'Learn Flutter',
    'description': 'Flutter is awesome!',
  };

  try {
    // ส่ง POST request พร้อม Body
    Response response = await dio.post(
      'https://api.example.com/create',
      data: data, // ส่ง body
    );

    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
```

ในตัวอย่างนี้ข้อมูล Body ที่ส่งจะเป็น JSON:

```
{
  "title": "Learn Flutter",
  "description": "Flutter is awesome!"
}
```

#### 3. การส่ง Headers

```
import 'package:dio/dio.dart';

void sendGetWithHeaders() async {
  Dio dio = Dio();

  // Headers ที่จะส่ง
  Map<String, dynamic> headers = {
    'Authorization': 'Bearer your_token_here',
    'Custom-Header': 'CustomValue',
  };

  try {
    // ส่ง GET request พร้อม Headers
    Response response = await dio.get(
      'https://api.example.com/items',
      options: Options(headers: headers), // ส่ง headers
    );

    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
```

#### 4. การรวม Query Parameters, Body Data และ Headers ทั้งหมดใน request เดียวกัน (เช่น POST Request)

```
import 'package:dio/dio.dart';

void sendPostWithAll() async {
  Dio dio = Dio();

  // Query Parameters
  Map<String, dynamic> queryParams = {
    'search': 'Flutter',
  };

  // Headers
  Map<String, dynamic> headers = {
    'Authorization': 'Bearer your_token_here',
    'Content-Type': 'application/json',
  };

  // Body ของ request
  Map<String, dynamic> data = {
    'title': 'Learn Flutter',
    'description': 'Flutter is a cross-platform framework by Google.',
  };

  try {
    // ส่ง POST request โดยมี Query Parameters, Headers และ Body
    Response response = await dio.post(
      'https://api.example.com/create',
      queryParameters: queryParams, // Query Parameters
      data: data, // Body ของ request
      options: Options(headers: headers), // Headers
    );

    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
```

#### สรุป:
- ```queryParameters```: ใช้ในการระบุข้อมูลที่ต้องการแนบไปกับ URL
- ```data```: ใช้ในการส่งข้อมูล Body ไปใน POST หรือ PUT request
- ```Options(headers: headers)```: ใช้ในการส่ง Headers