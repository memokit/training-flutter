import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_controller.dart';

class GetPage extends StatelessWidget {
  GetPage({super.key});

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      // body: Obx(() {
      //   // if (postController.isLoading.value) {
      //   //   return Center(child: CircularProgressIndicator());
      //   // }

      //   return ListView.builder(
      //     itemCount: postController.posts.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(postController.posts[index]['title']),
      //         subtitle: Text(postController.posts[index]['body']),
      //       );
      //     },
      //   );
      // }),
      body: Text("Hello"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoController.fetchData(); // เรียก API เมื่อกดปุ่ม
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
