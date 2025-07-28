import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignmen3/models/tasks_database.dart';
import 'package:flutter_assignmen3/screens/edit_task.dart';
import 'package:flutter_assignmen3/screens/new_task.dart';
import 'package:flutter_assignmen3/widgets/task_widget.dart';
import 'package:flutter_assignmen3/models/task_data.dart';
import 'package:flutter_assignmen3/models/tasks_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<TaskData>> taskList = TasksDatabase().getTask();

  void refreshTask() {
    setState(() {
      taskList = TasksDatabase().getTask();
    });
  }

  final length = TasksDatabase().getLength();

  Stream<int> taskNumberStream() async* {
    yield TasksDatabase().getLength();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: taskNumberStream(),
          builder: (context, snapshot) {
            final tasksLenght = snapshot.data;
            return Text("Tasks ($tasksLenght)");
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () async {
                final newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTask()),
                );
                if (newTask != null && newTask is TaskData) {
                  TasksDatabase.addTask(newTask);
                  refreshTask();
                }
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 13),
        child: SizedBox(
          width: double.infinity,
          child: FutureBuilder<List<TaskData>>(
            future: taskList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Something went wrong$Error");
              } else {
                var data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final task = data[index];
                    print(task.title);
                    print(task.description);
                    print(task.date);
                    return GestureDetector(
                      onTap: () async {
                        final editedTask = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditTask(task: task),
                          ),
                        );
                        if (editedTask != null && editedTask is TaskData) {
                          setState(() {
                            TasksDatabase.updateTaskAtIndex(index, editedTask);
                            refreshTask();
                          });
                        }
                      },

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TaskWidget(txt: task.title, date: task.date),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NewTask()),
          );
          if (result != null && result is TaskData) {
            print(result.title);
            print(result.description);
            print(result.date);
            print("Added task'");
          }
          setState(() {
            TasksDatabase.addTask(result);
            refreshTask();
            print("Added task titled'");
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        backgroundColor: const Color.fromARGB(255, 88, 163, 224),
        child: Icon(Icons.add),
      ),
    );
  }
}
