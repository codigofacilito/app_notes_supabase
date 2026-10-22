import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injection_container.dart';

class NotesView extends StatefulWidget {
  final String userId;
  const NotesView({super.key, required this.userId});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  //Aqui iniciamos nuestro View Model NoteViewModel


  //Aqui iniciamos nuestro View Model AuthViewModel


  @override
  void initState() {
    super.initState();
    // Inyección pasando el parámetro dinámico 'userId'

    //Cargamos loadNotes

  }

  void _showNoteDialog({String? id, String currentTitle = '', String currentContent = ''}) {
    final titleCtrl = TextEditingController(text: currentTitle);
    final contentCtrl = TextEditingController(text: currentContent);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(id == null ? 'Añadir Nota' : 'Editar Nota'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Título')),
            TextField(controller: contentCtrl, decoration: const InputDecoration(labelText: 'Contenido')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () {
              if (id == null) {
                //Agregamos la nota addNote enviamos texto de las cajas

              } else {
                //Editamos la nota editNote enviamos texto de las cajas

              }
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              tooltip: 'Cerrar Sesión',
              onPressed: () => {
                //Ejecutamos el dialog enviando el authViewModel
              } ,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        child: const Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) {
          //Verificamos si las notas estan cargando

          //Verificamos si hay notas

          return ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              final note ;
              return ListTile(
                title: Text(""),
                subtitle: Text(""),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => {
                        //Mostramos el dialog para editar
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => {
                        //Ejecutamos removeNote
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}