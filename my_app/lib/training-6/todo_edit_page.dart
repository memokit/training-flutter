import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-6/controllers/todo_detail_controller.dart';

class TodoEditPage extends StatefulWidget {
  TodoEditPage({super.key});

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  final TodoDetailController controller = Get.put(TodoDetailController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Edit'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controller.nameCtr,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.updateData(controller.nameCtr.text);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
