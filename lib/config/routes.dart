import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/note_add_screen.dart';
import '../presentation/screens/note_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String addNote = '/add-note';
  static const String noteDetail = '/note-detail';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        addNote: (context) => const NoteAddScreen(),
        noteDetail: (context) => const NoteDetailScreen(),
      };
}