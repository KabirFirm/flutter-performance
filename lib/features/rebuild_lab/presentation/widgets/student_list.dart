import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟠 StudentList rebuilt');

    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text('Student ${index + 1}'),
          subtitle: const Text('Class 5 • Batch A'),
        );
      },
    );
  }
}