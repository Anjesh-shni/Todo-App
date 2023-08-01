import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/features/presentation/bloc/app_level_bloc/app_bloc.dart';
import 'package:hive/hive.dart';

/*
Get_it package used for dependency injection.
*/

final serviceLocator = GetIt.instance;
Future<void> init() async {
  debugPrint("=======Dependecy injected=======");
  //
  var path = Directory.current.path;
  Hive.init(path);
  // ignore: unused_local_variable
  var box = await Hive.openBox('todo');
  //
  serviceLocator.registerSingleton<ApplicationBloc>(ApplicationBloc());
  //
}
