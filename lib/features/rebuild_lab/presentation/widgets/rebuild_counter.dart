import 'package:flutter/material.dart';

class RebuildCounter extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const RebuildCounter({
    super.key,
    required this.counter,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 RebuildCounter rebuilt');

    return Column(
      children: [
        Text(
          'Counter: $counter',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onIncrement,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}