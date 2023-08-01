import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/presentation/pages/edit_page.dart';
import '../features/presentation/pages/home_page.dart';

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
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'editScreen',
          name: "editScreen",
          builder: (BuildContext context, GoRouterState state) {
            return const EditScreen();
          },
        ),
      ],
    ),
  ],
);
