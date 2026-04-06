// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liturgy_dao.dart';

// ignore_for_file: type=lint
mixin _$LiturgyDaoMixin on DatabaseAccessor<AppDatabase> {
  $LiturgiesTable get liturgies => attachedDatabase.liturgies;
  LiturgyDaoManager get managers => LiturgyDaoManager(this);
}

class LiturgyDaoManager {
  final _$LiturgyDaoMixin _db;
  LiturgyDaoManager(this._db);
  $$LiturgiesTableTableManager get liturgies =>
      $$LiturgiesTableTableManager(_db.attachedDatabase, _db.liturgies);
}
