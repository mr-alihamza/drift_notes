import 'package:drift/drift.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get phoneNumber => text()();
  BoolColumn get isVerified => boolean().withDefault(Constant(false))();
}
