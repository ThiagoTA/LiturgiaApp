import 'package:drift/drift.dart';

class Liturgies extends Table {
  TextColumn get date => text()();
  TextColumn get json => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {date};
}