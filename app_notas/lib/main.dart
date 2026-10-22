
import 'package:flutter/material.dart';

import 'core/navigation/app_routes.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Iniciaamos inyeccion de dependencias
  setupLocator();

  //Aqui inicializamos supabase


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRoutes.router,
    );
  }
}