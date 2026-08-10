import 'package:flutter/material.dart';

import '../widgets/student_list.dart';

class ScrollingLabPage extends StatelessWidget {
  const ScrollingLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Lab'),
      ),
      body: const StudentList(),
    );
  }
}