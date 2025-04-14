# Hive Notes App

A simple note-taking application built with Flutter using Hive as a local database. This app allows users to manage notes easily and quickly, with data stored locally on the device.

https://github.com/user-attachments/assets/a5c54dac-e57b-4565-99de-5628f180fb9b

## 🌟 Features

- ✅ **Create new notes** - Create notes with title and content
- ✅ **View notes list** - See all notes in a sorted list
- ✅ **Edit notes** - Modify title and content of existing notes
- ✅ **Delete notes** - Remove notes with swipe-to-delete gesture
- ✅ **Local storage** - Data is stored locally using Hive database
- ✅ **Dark mode** - Supports light and dark themes according to system settings

## 🛠️ Technology

- **Flutter** - UI framework for building cross-platform applications
- **Hive** - Lightweight NoSQL database for local data storage
- **Provider** - State management for handling application state

## 📖 Project Architecture

This application follows Clean Architecture principles with an organized folder structure:

```
my_hive_app/
├── lib/
│   ├── main.dart                   
│   ├── app.dart                   
│   ├── config/                    
│   │   ├── routes.dart            
│   │   └── themes.dart             
│   ├── core/                  
│   │   └── constants/          
│   │       └── hive_constants.dart
│   ├── data/                  
│   │   ├── models/              
│   │   │   └── note_model.dart  
│   │   └── repositories/        
│   │       └── note_repository.dart
│   └── presentation/              
│       ├── screens/           
│       │   ├── home_screen.dart  
│       │   ├── note_add_screen.dart 
│       │   └── note_detail_screen.dart 
│       └── widgets/          
│           ├── note_card.dart    
│           └── note_form.dart 
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version recommended)
- Dart SDK
- Code editor such as VS Code or Android Studio

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/username/my_hive_app.git
   cd my_hive_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive code**
   ```bash
   flutter pub run build_runner build
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Using the Application

1. **Opening the app**
   - The app will display the main screen with a list of notes (or a message if there are no notes)

2. **Creating a new note**
   - Tap the + button in the bottom right corner
   - Fill in the title and content of the note
   - Tap the SAVE button

3. **Viewing and editing notes**
   - Tap on a note in the list to view details
   - Edit the title or content as needed
   - Tap the SAVE button to save changes

4. **Deleting notes**
   - Swipe a note to the left to delete
   - Confirm deletion in the dialog that appears

## 🔧 Troubleshooting

### Common issues and solutions:

1. **Error "Target of URI hasn't been generated"**
   - Run `flutter pub run build_runner build` to generate Hive model files

2. **Errors with Hive database**
   - Make sure Hive is properly initialized in main.dart
   - Check that registerAdapter has been called for all models

3. **Issues with flutter_slidable**
   - If experiencing version issues, use the alternative built-in Flutter Dismissible widget


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Hive Database - https://github.com/hivedb/hive
- Flutter Team - https://flutter.dev/

## Developer

- **Nama:** M Naufal Badruttamam
- **NRP:** 5025211240
- **Kelas:** Pemrograman Perangkat Bergerak B
