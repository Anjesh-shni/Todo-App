import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/data/model/task_model.dart';
import 'package:todo_app/features/presentation/pages/homeScreen/edit_notes_screen.dart';
import '../features/presentation/pages/homeScreen/add_notes_screen.dart';
import '../features/presentation/pages/homeScreen/home_screen.dart';

/*
The reason, i'm using Go_router instead of normal routing or list routing
because Go_router allow us to navigate at Top-level routes, Sub-routes,
also able to redirect page if needed,

using go_router, we have several option like context.push or context.go,
help us to pass parameter over any pages.
*/
final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: "home",
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'addNotes',
          name: "addNotes",
          builder: (BuildContext context, GoRouterState state) {
            return const AddNotesPage();
          },
        ),
        GoRoute(
          path: 'edit',
          name: "editScreen",
          builder: (BuildContext context, GoRouterState state) {
            return EditNotes(
              oldTask: state.extra as Task,
            );
          },
        ),
      ],

      /*
      // redirect:

       we will be using redirect pages incase of need any validation like,
      login validation if something you don't to give permisions without logged in,
      */
    ),
  ],
);
