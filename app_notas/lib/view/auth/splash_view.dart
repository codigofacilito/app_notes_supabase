import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/navigation/routes.dart';
import '../../injection_container.dart';
import '../notes/notes_view.dart';
import 'login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //Aqui iniciamos nuestro View Model AuthViewModel

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // Verificamos si existe sesión en flutter_secure_storage

    if (!mounted) return;

    //Validamos si hay una sesion
    if (true) {
      // Redirigir directamente al CRUD notesView y enviamos viewmodel.user!.id

    } else {
      // Redirigir a la pantalla de Login si no hay una sesion

    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
          Icon(Icons.edit_note_sharp,size: 80,
            color: theme.primaryColor,),
            Text(
              'App de Notas',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator()
        ],), // O el logotipo animado de tu app
      ),
    );
  }
}