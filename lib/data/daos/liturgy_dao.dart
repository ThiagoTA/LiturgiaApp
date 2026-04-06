import 'package:drift/drift.dart';
import 'package:liturgia_app/core/database/app_database.dart';
import 'package:liturgia_app/data/tables/liturgy_table.dart';

part 'liturgy_dao.g.dart';

@DriftAccessor(tables: [Liturgies])
class LiturgyDao extends DatabaseAccessor<AppDatabase> with _$LiturgyDaoMixin {
  LiturgyDao(AppDatabase db) : super(db);

  Future<void> insertLiturgy(LiturgiesCompanion data) {
    return into(liturgies).insertOnConflictUpdate(data);
  }

  Future<void> insertManyLiturgies(List<LiturgiesCompanion> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(liturgies, items);
    });
  }

  Future<Liturgy?> getByDate(String date) {
    return (select(
      liturgies,
    )..where((tbl) => tbl.date.equals(date))).getSingleOrNull();
  }

  Future<List<Liturgy>> getAll() {
    return select(liturgies).get();
  }

  Future<int> deleteBeforeDate(String date) {
    return (delete(
      liturgies,
    )..where((tbl) => tbl.date.isSmallerThanValue(date))).go();
  }

  Future<int> deleteAfterDate(String date) {
    return (delete(
      liturgies,
    )..where((tbl) => tbl.date.isBiggerThanValue(date))).go();
  }

  Future<void> deleteAll() {
    return (delete(liturgies).go());
  }
}
