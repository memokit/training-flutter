import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clean_app/presentation/controllers/todo/todo_controller.dart';

class TodoCreatePage extends GetView<TodoController> {
  TodoCreatePage({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtr = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Create'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameCtr,
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
                    controller.create(nameCtr.text);
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
