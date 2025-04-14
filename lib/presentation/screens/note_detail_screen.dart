import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/note_model.dart';
import '../../data/repositories/note_repository.dart';
import '../widgets/note_form.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteId = ModalRoute.of(context)!.settings.arguments as String;
    final noteRepository = Provider.of<NoteRepository>(context);
    final note = noteRepository.getNoteById(noteId);

    if (note == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Catatan')),
        body: const Center(child: Text('Catatan tidak ditemukan')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Catatan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context, noteRepository, note);
            },
          ),
        ],
      ),
      body: NoteForm(
        initialTitle: note.title,
        initialContent: note.content,
        onSave: (title, content) {
          final updatedNote = note.copyWith(
            title: title,
            content: content,
          );
          
          noteRepository.updateNote(updatedNote);
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
    BuildContext context,
    NoteRepository noteRepository,
    NoteModel note,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Catatan'),
        content: const Text('Yakin ingin menghapus catatan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('BATAL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('HAPUS'),
          ),
        ],
      ),
    );

    if (result == true) {
      noteRepository.deleteNote(note.id);
      Navigator.pop(context);
    }
  }
}