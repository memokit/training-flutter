import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clean_app/core/services/global_bindings.dart';
import 'package:my_clean_app/presentation/controllers/todo/todo_binding.dart';
import 'package:my_clean_app/presentation/pages/todo_create_page.dart';
import 'package:my_clean_app/presentation/pages/todo_edit_page.dart';
import 'package:my_clean_app/presentation/pages/todo_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBindings.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          binding: TodoBinding(),
          page: () => TodoPage(),
        ),
        GetPage(name: '/todoCreatePage', page: () => TodoCreatePage()),
        GetPage(name: '/todoEditPage', page: () => TodoEditPage()),
      ],
    );
  }
}
