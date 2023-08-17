import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/test_task/test_task_widget.dart';
import 'package:test_task/utils/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Column(
          children: [
            TestTaskWidget(
                text:
                    'Какой-то текстffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
                isChecked: true),
            // TestTaskWidget(text: 'Какой-то текст', isChecked: true),
            // TestTaskWidget(text: '1', isChecked: false),
          ],
        ),
      ),
    );
  }
}
