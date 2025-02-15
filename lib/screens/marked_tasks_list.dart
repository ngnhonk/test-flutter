import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/database_service.dart';
import 'package:task/models/task.dart';

class MarkedTasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DatabaseService>(context);

    return StreamBuilder<List<Task>>(
      stream: database.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        final tasks = snapshot.data!;
        final markedTasks = tasks.where((t) => t.isMarked).toList();

        return ListView.builder(
          itemCount: markedTasks.length,
          itemBuilder: (context, index) {
            final task = markedTasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.content),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: task.isMarked,
                    onChanged: (value) {
                      if (value != null) {
                        database.updateTask(task.copyWith(isMarked: value));
                      }
                    },

                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTask(context, database, task.id),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _deleteTask(BuildContext context, DatabaseService database, String id) {
    // ... [Same delete dialog as TaskList] ...
  }
}