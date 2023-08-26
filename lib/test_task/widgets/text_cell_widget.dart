import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/test_task/bloc/test_task_bloc.dart';

class MinimalTextSize extends StatelessWidget {
  final String sampleText =
      'Пример текста для определения минимального размера.';

  const MinimalTextSize({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IntrinsicWidth(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
              minHeight: 50,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  context.read<TestTaskBloc>().state.text,
                  style: const TextStyle(fontSize: 20.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
