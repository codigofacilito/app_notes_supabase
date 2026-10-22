// --- Diálogo de Confirmación Estilizado ---
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../auth/login_view.dart';

class LogoutAlertDialog {
  //Hay que recibir   AuthViewModel
  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
              const SizedBox(width: 10),
              const Text('¿Cerrar Sesión?'),
            ],
          ),
          content: const Text(
            'Tu sesión se cerrará de forma segura y tendrás que volver a ingresar tus credenciales.',
            style: TextStyle(color: Colors.grey, height: 1.4),
          ),
          actionsPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                  'Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                Navigator.pop(context); // Cierra el diálogo

                /* Llama al método de MobX que destruye el token en flutter_secure_storage
                y redireccionamos a splashView cuando se complete*/

              },
              child: const Text(
                  'Salir', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}