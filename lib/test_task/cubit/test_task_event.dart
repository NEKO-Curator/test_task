part of 'test_task_bloc.dart';

sealed class TestTaskEvent extends Equatable {
  const TestTaskEvent();

  @override
  List<Object> get props => [];
}

final class TestTaskFirstCellChanged extends TestTaskEvent {
  const TestTaskFirstCellChanged();

  @override
  List<Object> get props => [];
}

final class TestTaskSecondCellChanged extends TestTaskEvent {
  const TestTaskSecondCellChanged();

  @override
  List<Object> get props => [];
}

final class TestTaskCheckChanged extends TestTaskEvent {
  const TestTaskCheckChanged();

  @override
  List<Object> get props => [];
}
