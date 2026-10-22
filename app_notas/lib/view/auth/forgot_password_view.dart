import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../injection_container.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  //Aqui iniciamos nuestro View Model AuthViewModel


  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool validFake =false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.primaryColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:SingleChildScrollView(child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Icono Superior ---
                Icon(
                  Icons.lock_open_rounded,
                  size: 70,
                  color: theme.primaryColor,
                ),
                const SizedBox(height: 16),

                // --- Títulos ---
                Text(
                  '¿Olvidaste tu contraseña?',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ingresa tu correo electrónico registrado y te enviaremos un enlace seguro para restablecerla.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600], height: 1.4),
                ),
                const SizedBox(height: 35),

                // --- Campo de Email ---
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'Por favor ingresa tu correo';
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Ingresa un correo válido';
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // --- Botón de Envío ---
                Observer(
                  builder: (_) => SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      //Validemos que no se haga doble peticion al dar clic
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          //Ejecutamos el metodo sendRecoveryEmail
                        }
                      },
                      //Validemos que no se haga doble peticion al dar clic
                      child:  const Text('Enviar Enlace', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- Mensajes de Estado y Error ---
                Observer(
                  builder: (_) {
                    //Validamos si se envio el enlase
                    if (validFake) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline, color: Colors.green[700], size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '¡Enlace enviado con éxito! Revisa tu bandeja de entrada o carpeta de spam.',
                                style: TextStyle(color: Colors.green[700], fontSize: 13, height: 1.3),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    //Validamos si se envio el enlase
                    if (validFake) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red[700], size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              //Hay que agregar el mensaje de error
                              child: Text(
                                "Mensaje de error",
                                style: TextStyle(color: Colors.red[700], fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}