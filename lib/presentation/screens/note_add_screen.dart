import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/note_model.dart';
import '../../data/repositories/note_repository.dart';
import '../widgets/note_form.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
      ),
      body: NoteForm(
        onSave: (title, content) {
          final noteRepository = Provider.of<NoteRepository>(
            context, 
            listen: false
          );
          
          final newNote = NoteModel(
            title: title,
            content: content,
          );
          
          noteRepository.addNote(newNote);
          Navigator.pop(context);
        },
      ),
    );
  }
}