import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/data/model/task_model.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_state.dart';
import 'package:todo_app/utils/constant/colors.dart';
import '../task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (ctx, state) {
        List<Task> taskList = state.pendingTask;
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notes',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          // filteredNotes = sortNotesByModifiedTime(filteredNotes);
                        });
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                NotesList(noteList: taskList),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.barBg,
            tooltip: "Add Notes",
            onPressed: () => context.goNamed("addNotes"),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
