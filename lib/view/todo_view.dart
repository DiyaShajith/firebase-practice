import 'package:flutter/material.dart';
import 'package:todo_with_firebase/viewmodel/adduser_viewmodel.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Task> _tasks = [];
  final Userview userview = Userview(); // Create an instance of Userview

  void _addTask(String taskName) {
    if (taskName.isNotEmpty) {
      setState(() {
        _tasks.add(Task(name: taskName));
      });
      userview.addTask(taskName); // Add the task to Firestore
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_tasks[index].name),
            onDismissed: (direction) {
              // _deleteTask(index);
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(
                _tasks[index].name,
                style: TextStyle(
                  decoration: _tasks[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Checkbox(
                value: _tasks[index].isCompleted,
                onChanged: (bool? value) {
                  // _toggleTaskCompletion(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                Userview().addTask("complete");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Task {
  final String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
