import 'package:flutter/material.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟡 ExpensiveWidget rebuilt');

    // Intentionally expensive work.
    var result = 0;

    for (var i = 0; i < 5000000; i++) {
      result += i;
    }

    return Text(
      'Calculated value: $result',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}