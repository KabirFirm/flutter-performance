import 'package:flutter/material.dart';
import 'features/rebuild_lab/presentation/pages/rebuild_lab_page.dart';

void main() {
  runApp(const PerformanceLabApp());
}

class PerformanceLabApp extends StatelessWidget {
  const PerformanceLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Performance Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const RebuildLabPage(),
    );
  }
}