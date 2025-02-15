import 'package:flutter/material.dart';
import 'package:task/screens/task_list.dart';
import 'package:task/screens/add_task_screen.dart';
import 'package:task/screens/marked_tasks_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'All Tasks'),
              Tab(icon: Icon(Icons.add), text: 'Add Task'),
              Tab(icon: Icon(Icons.star), text: 'Marked Tasks'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TaskList(),
            AddTaskScreen(),
            MarkedTasksList(),
          ],
        ),
      ),
    );
  }
}