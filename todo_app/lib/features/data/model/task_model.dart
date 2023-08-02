// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String time;
  final String title;
  final String content;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.id,
     required this.time,
    required this.title,
    required this.content,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
     String? id,
      String? time,
    String? title,
    String? content,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      id: id??this.id,
      time: time??this.time,
      title: title ?? this.title,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted, 
      
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id':id,
       'time': time,
      'content': content,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? "",
      id: map['id']??"",
      time: map['time']??"",
      content: map['content'] ?? "",
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [title,id, content, isDone, isDeleted,time];
}
