import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'test_task_event.dart';
part 'test_task_state.dart';

class TestTaskBloc extends Bloc<TestTaskEvent, TestTaskState> {
  TestTaskBloc({required String text, required bool isChecked})
      : super(TestTaskState(isChecked: isChecked, text: text)) {
    on<TestTaskFirstCellChanged>(_onFirstCellChanged);
    on<TestTaskSecondCellChanged>(_onSecondCellChanged);
    on<TestTaskCheckChanged>(_onCheckChanged);
  }
  Future<void> _onFirstCellChanged(
    TestTaskFirstCellChanged event,
    Emitter<TestTaskState> emit,
  ) async {
    emit(state.copyWith(isSecondCellVisible: true));
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
}
