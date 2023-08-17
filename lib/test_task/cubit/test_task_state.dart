part of 'test_task_bloc.dart';

enum TestTaskStatus { initial, failure }

final class TestTaskState extends Equatable {
  final bool isChecked;
  final bool isSecondCellVisible;
  final TestTaskStatus status;
  final String text;

  const TestTaskState({
    this.isChecked = false,
    this.isSecondCellVisible = true,
    this.status = TestTaskStatus.initial,
    this.text = '',
  });

  TestTaskState copyWith({
    bool? isChecked,
    bool? isSecondCellVisible,
    TestTaskStatus? status,
    String? text,
  }) {
    return TestTaskState(
      isChecked: isChecked ?? this.isChecked,
      isSecondCellVisible: isSecondCellVisible ?? this.isSecondCellVisible,
      status: status ?? this.status,
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props => [isChecked, isSecondCellVisible, status];

  @override
  String toString() {
    return '''TestTaskState {
      isChecked: $isChecked,
      isSecondCellVisible: $isSecondCellVisible,
      status: $status,
      text: $text,
    }''';
  }
}
