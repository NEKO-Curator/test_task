import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/test_task/widgets/text_cell_widget.dart';
import 'package:test_task/test_task/bloc/test_task_bloc.dart';
import 'package:test_task/test_task/widgets/dotted_separator_widget.dart';

class TestTaskWidget extends StatefulWidget {
  final String text;
  final bool isChecked;

  const TestTaskWidget({
    Key? key,
    required this.text,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<TestTaskWidget> createState() => _TestTaskWidgetState();
}

class _TestTaskWidgetState extends State<TestTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TestTaskBloc(isChecked: widget.isChecked, text: widget.text),
      child: BlocBuilder<TestTaskBloc, TestTaskState>(
        builder: (context, state) {
          return Row(
            children: [
              //первая ячейка - текст
              Flexible(
                flex: state.isSecondCellVisible ? 0 : 1,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (!state.isSecondCellVisible) {
                      final textPainter = TextPainter(
                        text: TextSpan(
                          text: state.text,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                      );

                      textPainter.layout(maxWidth: constraints.maxWidth - 12.0);
                      if (!textPainter.didExceedMaxLines) {
                        context.read<TestTaskBloc>().add(
                              const TestTaskFirstCellChanged(),
                            );
                      }
                    }
                    return const MinimalTextSize();
                  },
                ),
              ),
              //вторая ячейка - пунктирная линия (если она должна быть видимой, если нет то контейнер)
              if (state.isSecondCellVisible)
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.minWidth <= 10.0) {
                        context.read<TestTaskBloc>().add(
                              const TestTaskSecondCellChanged(),
                            );
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 50,
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(),
                          ),
                        ),
                        child: const DottedSeparatorWidget(),
                      );
                    },
                  ),
                )
              else
                Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(),
                    ),
                  ),
                  height: 50,
                  width: 10,
                ),
              //третья ячейка - чекбокс
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Checkbox(
                    value: state.isChecked,
                    onChanged: (_) {
                      context
                          .read<TestTaskBloc>()
                          .add(const TestTaskCheckChanged());
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
