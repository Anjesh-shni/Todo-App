// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/data/model/task_model.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_event.dart';


class EditNotes extends StatelessWidget {
  final Task oldTask;
  const EditNotes({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    final TextEditingController contentController =
        TextEditingController(text: oldTask.content);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: titleController,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade200, fontSize: 25)),
                  ),
                  TextField(
                    controller: contentController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something here...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var editedTask = Task(
            title: titleController.text,
            content: contentController.text,
            id: oldTask.id,
            time: DateTime.now().toString(),
            isDone: false,
          );
          context
              .read<TaskBloc>()
              .add(EditTask(oldTask: oldTask, newTask: editedTask));
          context.pop();
        },
        tooltip: "Save",
        elevation: 10,
        backgroundColor: Colors.grey.shade500,
        child: const Icon(
          Icons.save_sharp,
        ),
      ),
    );
  }
}
