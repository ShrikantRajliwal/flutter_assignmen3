import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  String? txt;
  String? date;

  TaskWidget({super.key, this.txt, this.date});

  @override
  build(context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(18),

          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 242, 242),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.menu),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$txt",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              "$date",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }
}
