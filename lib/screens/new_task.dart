import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignmen3/models/task_data.dart';

class NewTask extends StatefulWidget {
  // final TaskData task;
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add task Screen")),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Name",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F2F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F2F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 120,
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Due Date",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F2F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 70,
                    child: TextField(
                      controller: dueDateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 320),
              TextButton(
                onPressed: () {
                  final newTask = TaskData(
                    title: titleController.text,
                    description: descriptionController.text,
                    date: dueDateController.text,
                  );
                  // print(newTask.title);
                  // print(newTask.description);
                  // print(newTask.date);
                  Navigator.pop(context, newTask);
                },

                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 35, 141, 227),
                  padding: EdgeInsets.symmetric(horizontal: 160, vertical: 15),
                ),
                child: Text("Add task", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
