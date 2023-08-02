import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/route/route.dart';
import 'package:todo_app/utils/constant/colors.dart';
import 'services/service_loccator.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("=======APP STARTED=======");
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (_) => di.getIt<TaskBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Todo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.barBg,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: AppColors.barBg,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
