import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/pages/home_page.dart';
import 'package:todo_app/services/service_loccator.dart';
import 'package:todo_app/utils/constant/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("=======APP STARTED=======");
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      // routerConfig: router,

      home: const HomeScreen(),
    );
  }
}
