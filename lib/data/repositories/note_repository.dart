import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants/hive_constants.dart';
import '../models/note_model.dart';

class NoteRepository extends ChangeNotifier {
  late Box<NoteModel> _notesBox;

  NoteRepository() {
    _notesBox = Hive.box<NoteModel>(HiveConstants.notesBox);
  }

  List<NoteModel> getAllNotes() {
    return _notesBox.values.toList();
  }

  NoteModel? getNoteById(String id) {
    return _notesBox.values.firstWhere((note) => note.id == id);
  }

  Future<void> addNote(NoteModel note) async {
    await _notesBox.put(note.id, note);
    notifyListeners();
  }

  Future<void> updateNote(NoteModel note) async {
    await _notesBox.put(note.id, note);
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    final noteKey = _notesBox.keys.firstWhere(
      (key) => _notesBox.get(key)?.id == id,
      orElse: () => null,
    );

    if (noteKey != null) {
      await _notesBox.delete(noteKey);
      notifyListeners();
    }
  }
}
