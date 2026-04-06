import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:liturgia_app/core/constants/settings_constants.dart';
import 'package:liturgia_app/data/daos/settings_dao.dart';
import 'package:liturgia_app/data/tables/liturgy_table.dart';
import 'package:liturgia_app/data/tables/settings_table.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Liturgies, Settings],
  daos: [SettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(settings);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/liturgies.sqlite');
    return NativeDatabase(file);
  });
}