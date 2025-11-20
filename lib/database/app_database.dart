import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift_notes_app/database/notes_table.dart';
part 'app_database.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() {
    return driftDatabase(name: "My Database");
  });
}

@DriftDatabase(tables: [NotesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addNotes({
    required String name,
    required String description,
    required String phoneNumber,
    required bool isVerified,
  }) {
    return into(notesTable).insert(
      NotesTableCompanion(
        name: Value(name),
        description: Value(description),
        phoneNumber: Value(phoneNumber),
        isVerified: Value(isVerified),
      ),
    );
  }

  Stream<List<NotesTableData>> fetchNotes() {
    return select(notesTable).watch();
  }

  Future<int> updateNotes({
    required String name,
    required String description,
    required String phoneNumber,
    required bool isVerified,
    required int id,
  }) {
    return (update(notesTable)..where((tbl) => tbl.id.equals(id))).write(
      NotesTableCompanion(
        name: Value(name),
        description: Value(description),
        phoneNumber: Value(phoneNumber),
        isVerified: Value(isVerified),
      ),
    );
  }

  Future deleteNotes(id) =>
      (delete(notesTable)..where((tbl) => tbl.id.equals(id))).go();
}
