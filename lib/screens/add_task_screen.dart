import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../services/database_service.dart';


class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DatabaseService>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter title' : null,
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter content' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await database.addTask(Task(
                    id: 'temp', // Firestore sẽ ghi đè lại giá trị này
                    title: _titleController.text,
                    content: _contentController.text,
                    createdAt: DateTime.now(),
                  ));
                  _titleController.clear();
                  _contentController.clear();
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}