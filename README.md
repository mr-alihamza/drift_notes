# drift_notes

A Flutter note-taking / journaling app that uses **Drift** (formerly Moor) for local persistence.

## 🚀 Features  
- Create, edit, and delete notes  
- Offline storage with **Drift** (SQLite)  
- Cross-platform support: Android, iOS, Web, Windows, macOS  
- Clean architecture: separation between UI and database layer  
- Reactive UI: automatically updates when database changes

## 🧱 Architecture & Technologies  
- **Flutter** for UI  
- **Dart** as programming language  
- **Drift** for a type-safe, reactive local database  
- **Build Runner** + **drift_dev** for code generation  
- Structured project layout: `lib/`, `test/`, and platform-specific dirs  

## 🛠️ Getting Started  

**Prerequisites**  
- Flutter (stable)  
- Dart (comes with Flutter)  
- A device or emulator (Android, iOS, web)  

**Setup**  
```bash
git clone https://github.com/AliHamza324/drift_notes.git  
cd drift_notes  
flutter pub get  
```

**Generate Drift code**  
```bash
flutter pub run build_runner build --delete-conflicting-outputs  
```

**Run the app**  
```bash
flutter run  
```  
To run on web:  
```bash
flutter run -d chrome  
```

## 🧾 Usage  
1. Open the app to see your list of notes  
2. Tap the “+” button to create a new note (title + content)  
3. Tap an existing note to edit it, or swipe to delete  
4. Changes are stored locally and persist across app restarts  

## 🧠 Database Structure  
Using **Drift**, the schema might have:  
- `notes` table  
  - `id` (auto-increment integer)  
  - `title` (text)  
  - `content` (text)  
  - `created_at` (DateTime)  
  - `updated_at` (DateTime)  

You'll have a `Database` class annotated with `@DriftDatabase(...)`, generated part file, and a `NoteDao` for CRUD.

## ✅ Testing  
- Write unit and integration tests in the `test/` folder  
- Run tests with:  
```bash
flutter test  
```  
- Use an **in-memory Drift database** for fast DB tests

## 🙌 Contributing  
Contributions are very welcome!  
- Open issues for bugs or features  
- Create pull requests for improvements  
- Suggest enhancements: categories, tags, search, sync, etc.

Workflow: fork → branch → commit → PR.

## 📜 License  
This project is licensed under the **MIT License**. (Or choose your preferred license.)

## 🎉 Acknowledgements  
- Thanks to the **Drift** team for the powerful local database  
- Thanks to the **Flutter** community for the rich ecosystem  