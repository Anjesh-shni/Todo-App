import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/features/data/model/task_model.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_event.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<EditTask>(_onEditTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        pendingTask: List.from(state.pendingTask)..add(event.task),
        completedTask: state.completedTask,
        favouriteTask: state.favouriteTask,
        removeTask: state.removeTask,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.pendingTask;
    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTask = List.from(completedTask),
            //..remove(task),

            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(
      TaskState(
        pendingTask: pendingTask,
        completedTask: completedTask,
        favouriteTask: state.favouriteTask,
        removeTask: state.removeTask,
      ),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingTask: state.pendingTask,
        completedTask: state.completedTask,
        favouriteTask: state.favouriteTask,
        removeTask: List.from(state.removeTask)..remove(event.task)));
  }

  void _onEditTask(EditTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favouriteTask = state.favouriteTask;

    if (event.oldTask.isDone == true) {
      favouriteTask
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TaskState(
      pendingTask: List.from(state.pendingTask)
        ..remove(event.oldTask)
        ..insert(0, event.newTask),
      completedTask: state.completedTask..remove(event.oldTask),
      favouriteTask: favouriteTask,
      removeTask: state.removeTask,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
