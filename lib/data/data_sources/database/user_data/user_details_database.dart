import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart' as FlutterQueryExecutor;
import 'package:drift_notes_app/data/data_sources/database/user_data/user_details_table.dart';
part 'user_details_database.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() {
    return FlutterQueryExecutor.driftDatabase(name: "name");
  });
}

@DriftDatabase(tables: [UserDetailsTable])
class UserDetailsDatabase extends _$UserDetailsDatabase {
  UserDetailsDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}

//this command is used to generate this file: user_details_database.g.dart
//flutter pub run build_runner build --delete-conflicting-outputs
