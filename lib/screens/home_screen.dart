import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignmen3/screens/edit_task.dart';
import 'package:flutter_assignmen3/screens/new_task.dart';
import 'package:flutter_assignmen3/widgets/task_widget.dart';
import 'package:flutter_assignmen3/models/task_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<TaskData>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    // print("TEXE");
    return getData();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTask()),
                );
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
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Something we wrong$Error");
              } else {
                var data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final task = data[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTask(task: task),
                        ),
                      ),
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => NewTask()));
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
