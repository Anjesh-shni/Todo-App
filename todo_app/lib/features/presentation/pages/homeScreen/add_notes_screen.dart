// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/data/model/task_model.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_event.dart';

import '../../../../services/id_generate.dart';

class AddNotesPage extends StatefulWidget {
  
  const AddNotesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    controller: _titleController,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade200, fontSize: 25)),
                  ),
                  TextField(
                    controller: _contentController,
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
          var task = Task(
            title: _titleController.text,
            content: _contentController.text,
            id: GUIDGen.generate(),
            time: DateTime.now().toString(),
          );
          context.read<TaskBloc>().add(AddTask(task: task));
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

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }
}
