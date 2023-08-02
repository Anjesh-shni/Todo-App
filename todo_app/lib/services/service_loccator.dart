import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/presentation/bloc/app_level_bloc/app_bloc.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';

/*
Get_it package used for dependency injection.
*/

final getIt = GetIt.instance;
//Init function
Future<void> init() async {
  debugPrint("=======Dependecy injected=======");
  //local storage facility
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  //Application Bloc will used to control bottom navigatiionBar
  getIt.registerSingleton<ApplicationBloc>(ApplicationBloc());

  //Task Bloc handle Task create,delete,update.
  getIt.registerSingleton<TaskBloc>(TaskBloc());
}
