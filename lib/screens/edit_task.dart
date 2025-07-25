import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignmen3/models/task_data.dart';

class EditTask extends StatefulWidget {
  final TaskData task;

  EditTask({super.key, required this.task});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(
      text: widget.task.description,
    );
    dueDateController = TextEditingController(text: widget.task.date);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit task Screen")),
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
                      color: const Color.fromARGB(255, 230, 231, 233),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      controller: titleController,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Data",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 231, 233),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 120,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      controller: descriptionController,
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
                      color: const Color.fromARGB(255, 230, 231, 233),
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
              Positioned(
                child: TextButton(
                  onPressed: () {
                    final changeTask = TaskData(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dueDateController.text,
                    );
                    Navigator.pop(context, changeTask);
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white)),

                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 35, 141, 227),
                    padding: EdgeInsets.symmetric(
                      horizontal: 160,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
