import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'test_task_event.dart';
part 'test_task_state.dart';

class TestTaskBloc extends Bloc<TestTaskEvent, TestTaskState> {
  TestTaskBloc({required String text, required bool isChecked})
      : super(TestTaskState(isChecked: isChecked, text: text)) {
    on<TestTaskSecondCellChanged>(_onSecondCellChanged);
    on<TestTaskCheckChanged>(_onCheckChanged);
    on<TestTaskChangeConstraintWidth>(_onChangeConstraintWidth);
  }

  Future<void> _onSecondCellChanged(
    TestTaskSecondCellChanged event,
    Emitter<TestTaskState> emit,
  ) async {
    emit(state.copyWith(isSecondCellVisible: false));
  }

  Future<void> _onCheckChanged(
    TestTaskCheckChanged event,
    Emitter<TestTaskState> emit,
  ) async {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  Future<void> _onChangeConstraintWidth(
    TestTaskChangeConstraintWidth event,
    Emitter<TestTaskState> emit,
  ) async {
    final textPainter = TextPainter(
      text: TextSpan(
          text: state.text, style: const TextStyle(color: Colors.black)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: event.width - 12.0);
    if (!textPainter.didExceedMaxLines) {
      emit(state.copyWith(isSecondCellVisible: true));
    }
  }
}
