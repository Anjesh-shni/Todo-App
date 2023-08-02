// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import '../../../data/model/task_model.dart';

class TaskState extends Equatable {
  final List<Task> completedTask;
  final List<Task> pendingTask;
  final List<Task> favouriteTask;
  final List<Task> removeTask;
  const TaskState({
    this.completedTask = const <Task>[],
    this.pendingTask = const <Task>[],
    this.favouriteTask = const <Task>[],
    this.removeTask = const <Task>[],
  });

  @override
  List<Object?> get props =>
      [completedTask, pendingTask, favouriteTask, removeTask];

  Map<String, dynamic> toMap() {
    return {
      'completedTask': completedTask.map((e) => e.toMap()).toList(),
      'pendingTask': pendingTask.map((e) => e.toMap()).toList(),
      'favouriteTask': favouriteTask.map((e) => e.toMap()).toList(),
      'removeTask': removeTask.map((e) => e.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      completedTask:
          List.from(map['completedTask']?.map((e) => Task.fromMap(e))),
               pendingTask:
          List.from(map['pendingTask']?.map((e) => Task.fromMap(e))),
               favouriteTask:
          List.from(map['favouriteTask']?.map((e) => Task.fromMap(e))),
               removeTask:
          List.from(map['removeTask']?.map((e) => Task.fromMap(e))),
    );
  }
}
