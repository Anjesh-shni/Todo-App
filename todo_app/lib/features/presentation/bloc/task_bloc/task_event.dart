import 'package:equatable/equatable.dart';
import 'package:todo_app/features/data/model/task_model.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class EditTask extends TaskEvent{
  final Task newTask;
  final Task oldTask;

  EditTask({required this.newTask, required this.oldTask});

    @override
  List<Object?> get props => [newTask,oldTask];
}