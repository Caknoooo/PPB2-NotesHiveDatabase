import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/routes.dart';
import '../../data/repositories/note_repository.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Notes'),
      ),
      body: Consumer<NoteRepository>(
        builder: (context, noteRepository, child) {
          final notes = noteRepository.getAllNotes();
          
          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'Tidak ada catatan.\nTambahkan catatan baru!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: NoteCard(
                  note: note,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.noteDetail,
                      arguments: note.id,
                    );
                  },
                  onDelete: () {
                    noteRepository.deleteNote(note.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}