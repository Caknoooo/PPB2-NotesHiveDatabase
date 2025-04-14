import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/constants/hive_constants.dart';
import 'data/models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  
  Hive.registerAdapter(NoteModelAdapter());
  
  await Hive.openBox<NoteModel>(HiveConstants.notesBox);
  
  runApp(const MyApp());
}