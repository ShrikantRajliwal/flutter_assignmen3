import 'package:flutter_assignmen3/models/task_data.dart';

class TasksDatabase {
  static final List<TaskData> taskList = [];

  Future<List<TaskData>> getTask() async {
    await Future.delayed(Duration(seconds: 1));
    return taskList;
  }

  int getLength() {
    return taskList.length;
  }

  static void addTask(TaskData task) {
    taskList.add(task);
  }

  static void updateTaskAtIndex(int index, TaskData updatedTask) {
    taskList[index] = updatedTask;
  }
}
