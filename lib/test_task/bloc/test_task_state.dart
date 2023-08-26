part of 'test_task_bloc.dart';

enum TestTaskStatus { initial, failure }

final class TestTaskState extends Equatable {
  final bool isChecked;
  final double minimumWidgetWidth;
  final bool isSecondCellVisible;
  final TestTaskStatus status;
  final String text;

  const TestTaskState({
    this.isChecked = false,
    this.isSecondCellVisible = true,
    this.minimumWidgetWidth = 0.0,
    this.status = TestTaskStatus.initial,
    this.text = '',
  });

  TestTaskState copyWith({
    bool? isChecked,
    bool? isSecondCellVisible,
    double? minimumWidgetWidth,
    TestTaskStatus? status,
    String? text,
  }) {
    return TestTaskState(
      isChecked: isChecked ?? this.isChecked,
      minimumWidgetWidth: minimumWidgetWidth ?? this.minimumWidgetWidth,
      isSecondCellVisible: isSecondCellVisible ?? this.isSecondCellVisible,
      status: status ?? this.status,
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props =>
      [isChecked, isSecondCellVisible, status, minimumWidgetWidth, text];

  @override
  String toString() {
    return '''TestTaskState {
      isChecked: $isChecked,
      minimumWidgetWidth: $minimumWidgetWidth,
      isSecondCellVisible: $isSecondCellVisible,
      status: $status,
      text: $text,
    }''';
  }
}
