import 'package:app_notas/core/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../view/auth/forgot_password_view.dart';
import '../../view/auth/login_view.dart';
import '../../view/auth/register_view.dart';
import '../../view/auth/splash_view.dart';
import '../../view/notes/notes_view.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: splashView,
    errorBuilder: (context, state) => _errorRoute(),
    routes: [
      GoRoute(
        path: splashView,
        name: 'splash',
        builder: (context, state) => SplashView(),
        routes: [
        ],
      ),
      GoRoute(
        path: loginView,
        name: 'login',
        builder: (context, state) => LoginView(),
        routes: [
          GoRoute(
            path: registerView,
            name: 'register',
            builder: (context, state) => RegisterView(),
          ),
          GoRoute(
            path: forgotPasswordView,
            name: 'forgotPassword',
            builder: (context, state) => ForgotPasswordView(),
          )
        ],
      ),
      GoRoute(
        path: notesView,
        name: 'notes',
        builder: (context, state) => NotesView(userId: state.extra as String),
        routes: [
          //Ventanas dentro de notes
        ],
      ),
    ],
  );

  static _errorRoute() {
    return Scaffold(body: Center(child: Text("Error: View not found")));
  }
}
