import 'package:flutter/material.dart';

import '../widgets/expensive_widget.dart';
import '../widgets/rebuild_counter.dart';
import '../widgets/student_list.dart';

class RebuildLabPage extends StatefulWidget {
  const RebuildLabPage({super.key});

  @override
  State<RebuildLabPage> createState() => _RebuildLabPageState();
}

class _RebuildLabPageState extends State<RebuildLabPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 RebuildLabPage rebuilt');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild Lab'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          RebuildCounter(
            counter: counter,
            onIncrement: () {
              setState(() {
                counter++;
              });
            },
          ),

          const SizedBox(height: 20),

          const ExpensiveWidget(),

          const SizedBox(height: 20),

          const Expanded(
            child: StudentList(),
          ),
        ],
      ),
    );
  }
}