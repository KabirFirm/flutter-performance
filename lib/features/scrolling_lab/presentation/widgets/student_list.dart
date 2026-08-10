import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5000,
      itemBuilder: (context, index) {
        return StudentCard(
          index: index,
        );
      },
    );
  }
}

class StudentCard extends StatelessWidget {
  final int index;

  const StudentCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${index + 1}'),
      ),
      title: Text('Student ${index + 1}'),
      subtitle: const Text('Flutter Performance Lab'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}