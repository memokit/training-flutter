#  การจัดการ Response และการอ่านข้อมูลที่ได้รับ


การจัดการ Response และการอ่านข้อมูลจาก API โดยใช้ ```Dio``` ใน Flutter นั้นสามารถทำได้โดยใช้ ```Model``` เพื่อเก็บข้อมูลที่ได้รับจาก API ก่อนที่จะนำไปแสดงผลหรือประมวลผลต่อไป ในที่นี้จะแสดงตัวอย่างการดึงข้อมูลและนำข้อมูลที่ได้รับมาเก็บใน ```Model``` โดยมีโครงสร้างดังนี้

1. การใช้งาน ```Dio``` สำหรับการดึงข้อมูลจาก API
2. การสร้าง ```Model``` สำหรับการจัดการข้อมูล
3. การแปลงข้อมูลจาก JSON เป็น Model

#### 1. สร้าง Model สำหรับจัดการข้อมูล
สร้างไฟล์ ```post_model.dart``` เพื่อเป็นตัวอย่างสำหรับ Model ที่เก็บข้อมูลที่ดึงจาก API สมมติว่าเราต้องการดึงข้อมูลจาก API ที่ให้ข้อมูลเกี่ยวกับโพสต์:

```
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // ฟังก์ชันเพื่อแปลง JSON ไปเป็น Object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // ฟังก์ชันเพื่อแปลง Object ไปเป็น JSON (หากต้องการ)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
```

#### 2. การใช้ Dio สำหรับเรียก API และจัดการ Response
สร้างฟังก์ชันในไฟล์ ```post_service.dart``` เพื่อเรียกใช้ API ด้วย ```Dio``` และนำข้อมูลที่ได้รับไปแปลงเป็น ```Post```:

```
import 'package:dio/dio.dart';
import 'post_model.dart';

class PostService {
  Dio dio = Dio();

  // ฟังก์ชันดึงข้อมูลโพสต์จาก API
  Future<List<Post>> fetchPosts() async {
    try {
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');

      // ตรวจสอบว่าข้อมูลที่ได้รับมาเป็น List หรือไม่
      if (response.statusCode == 200) {
        List<Post> posts = (response.data as List)
            .map((postJson) => Post.fromJson(postJson))
            .toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load posts');
    }
  }
}
```

#### 3. สร้าง GetX Controller
สร้างไฟล์ ```post_controller.dart``` สำหรับ ```GetxController``` ที่จะใช้ในการดึงข้อมูล:

```
import 'package:get/get.dart';
import 'post_model.dart';
import 'post_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs; // Observable list ของ Post
  var isLoading = true.obs; // Observable สำหรับสถานะโหลดข้อมูล

  @override
  void onInit() {
    fetchPosts(); // เรียกฟังก์ชันเพื่อดึงข้อมูลเมื่อ Controller ถูกสร้าง
    super.onInit();
  }

  // ฟังก์ชันดึงข้อมูลโพสต์จาก API
  void fetchPosts() async {
    try {
      isLoading(true); // ตั้งค่าสถานะโหลดข้อมูลเป็น true
      var fetchedPosts = await PostService().fetchPosts();
      posts.assignAll(fetchedPosts); // เก็บข้อมูลที่ดึงมาใน observable list
    } finally {
      isLoading(false); // ตั้งค่าสถานะโหลดข้อมูลเป็น false
    }
  }
}
```

#### 4. นำข้อมูลไปแสดงผล
นำ GetX Controller ไปใช้ในหน้าจอหลักของแอป:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'post_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // ใช้ GetMaterialApp แทน MaterialApp
      title: 'GetX and Dio Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostScreen(),
    );
  }
}

class PostScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController()); // สร้าง Instance ของ PostController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (postController.posts.isEmpty) {
          return Center(child: Text('No posts found'));
        } else {
          return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(postController.posts[index].title),
                subtitle: Text(postController.posts[index].body),
              );
            },
          );
        }
      }),
    );
  }
}
```

#### สรุป
ในโค้ดข้างต้น เราได้ทำการ:

- สร้าง ```PostController``` ที่ใช้ ```GetxController``` เพื่อดึงข้อมูลโพสต์จาก API โดยใช้ ```Dio```
- ใช้ ```Observable``` สำหรับเก็บข้อมูลโพสต์และสถานะการโหลด
- นำ ```PostController``` ไปใช้งานใน UI โดยใช้ ```Get.put``` และใช้ ```Obx``` ในการอัปเดต UI ตามการเปลี่ยนแปลงของข้อมูล
