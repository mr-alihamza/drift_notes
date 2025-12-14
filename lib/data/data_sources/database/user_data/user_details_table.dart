import 'package:drift/drift.dart';

class UserDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get imagePath => text()();
  BoolColumn get isVerified => boolean().withDefault(Constant(false))();
}
