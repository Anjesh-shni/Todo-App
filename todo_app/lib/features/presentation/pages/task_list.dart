import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_event.dart';
import '../../../utils/constant/colors.dart';
import '../../data/model/task_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.noteList,
  });

  final List<Task> noteList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          var allNote = noteList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            color: AppColors.getRandomColor(),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onLongPress: () {
                  context.read<TaskBloc>().add(DeleteTask(task: allNote));
                },
                onTap: () async {
                  context.goNamed(
                    "editScreen",
                    extra: allNote,
                  );
                },
                title: RichText(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: '${allNote.title} \n',
                      style: allNote.isDone!
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough)
                          : const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1.5,
                            ),
                      children: [
                        TextSpan(
                          text: allNote.content,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        )
                      ]),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(allNote.time)),
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade800),
                  ),
                ),
                trailing: Checkbox(
                  value: allNote.isDone,
                  onChanged: (value) {
                    context.read<TaskBloc>().add(UpdateTask(task: allNote));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
