// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LiturgiesTable extends Liturgies
    with TableInfo<$LiturgiesTable, Liturgy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LiturgiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
    'json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [date, json, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liturgies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Liturgy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
        _jsonMeta,
        json.isAcceptableOrUnknown(data['json']!, _jsonMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Liturgy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Liturgy(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      json: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LiturgiesTable createAlias(String alias) {
    return $LiturgiesTable(attachedDatabase, alias);
  }
}

class Liturgy extends DataClass implements Insertable<Liturgy> {
  final String date;
  final String json;
  final String updatedAt;
  const Liturgy({
    required this.date,
    required this.json,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    map['json'] = Variable<String>(json);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  LiturgiesCompanion toCompanion(bool nullToAbsent) {
    return LiturgiesCompanion(
      date: Value(date),
      json: Value(json),
      updatedAt: Value(updatedAt),
    );
  }

  factory Liturgy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Liturgy(
      date: serializer.fromJson<String>(json['date']),
      json: serializer.fromJson<String>(json['json']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'json': serializer.toJson<String>(json),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Liturgy copyWith({String? date, String? json, String? updatedAt}) => Liturgy(
    date: date ?? this.date,
    json: json ?? this.json,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Liturgy copyWithCompanion(LiturgiesCompanion data) {
    return Liturgy(
      date: data.date.present ? data.date.value : this.date,
      json: data.json.present ? data.json.value : this.json,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Liturgy(')
          ..write('date: $date, ')
          ..write('json: $json, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, json, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Liturgy &&
          other.date == this.date &&
          other.json == this.json &&
          other.updatedAt == this.updatedAt);
}

class LiturgiesCompanion extends UpdateCompanion<Liturgy> {
  final Value<String> date;
  final Value<String> json;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const LiturgiesCompanion({
    this.date = const Value.absent(),
    this.json = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LiturgiesCompanion.insert({
    required String date,
    required String json,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : date = Value(date),
       json = Value(json),
       updatedAt = Value(updatedAt);
  static Insertable<Liturgy> custom({
    Expression<String>? date,
    Expression<String>? json,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (json != null) 'json': json,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LiturgiesCompanion copyWith({
    Value<String>? date,
    Value<String>? json,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return LiturgiesCompanion(
      date: date ?? this.date,
      json: json ?? this.json,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LiturgiesCompanion(')
          ..write('date: $date, ')
          ..write('json: $json, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fontSizeMeta = const VerificationMeta(
    'fontSize',
  );
  @override
  late final GeneratedColumn<int> fontSize = GeneratedColumn<int>(
    'font_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(SettingsDefaults.fontSizeDefault),
  );
  static const VerificationMeta _continuousReadingMeta = const VerificationMeta(
    'continuousReading',
  );
  @override
  late final GeneratedColumn<bool> continuousReading = GeneratedColumn<bool>(
    'continuous_reading',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("continuous_reading" IN (0, 1))',
    ),
    defaultValue: const Constant(SettingsDefaults.continuousReadingDefault),
  );
  static const VerificationMeta _biblicalReferenceMeta = const VerificationMeta(
    'biblicalReference',
  );
  @override
  late final GeneratedColumn<bool> biblicalReference = GeneratedColumn<bool>(
    'biblical_reference',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("biblical_reference" IN (0, 1))',
    ),
    defaultValue: const Constant(SettingsDefaults.biblicalReferenceDefault),
  );
  static const VerificationMeta _previousDaysMeta = const VerificationMeta(
    'previousDays',
  );
  @override
  late final GeneratedColumn<int> previousDays = GeneratedColumn<int>(
    'previous_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(SettingsDefaults.previousDaysDefault),
  );
  static const VerificationMeta _futureDaysMeta = const VerificationMeta(
    'futureDays',
  );
  @override
  late final GeneratedColumn<int> futureDays = GeneratedColumn<int>(
    'future_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(SettingsDefaults.futureDaysDefault),
  );
  static const VerificationMeta _dailyNotificationEnabledMeta =
      const VerificationMeta('dailyNotificationEnabled');
  @override
  late final GeneratedColumn<bool> dailyNotificationEnabled =
      GeneratedColumn<bool>(
        'daily_notification_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("daily_notification_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(SettingsDefaults.dailyNotificationEnabled),
      );
  static const VerificationMeta _dailyNotificationHourMeta =
      const VerificationMeta('dailyNotificationHour');
  @override
  late final GeneratedColumn<int> dailyNotificationHour = GeneratedColumn<int>(
    'daily_notification_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(SettingsDefaults.dailyNotificationHour),
  );
  static const VerificationMeta _dailyNotificationMinuteMeta =
      const VerificationMeta('dailyNotificationMinute');
  @override
  late final GeneratedColumn<int> dailyNotificationMinute =
      GeneratedColumn<int>(
        'daily_notification_minute',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(SettingsDefaults.dailyNotificationMinute),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fontSize,
    continuousReading,
    biblicalReference,
    previousDays,
    futureDays,
    dailyNotificationEnabled,
    dailyNotificationHour,
    dailyNotificationMinute,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('font_size')) {
      context.handle(
        _fontSizeMeta,
        fontSize.isAcceptableOrUnknown(data['font_size']!, _fontSizeMeta),
      );
    }
    if (data.containsKey('continuous_reading')) {
      context.handle(
        _continuousReadingMeta,
        continuousReading.isAcceptableOrUnknown(
          data['continuous_reading']!,
          _continuousReadingMeta,
        ),
      );
    }
    if (data.containsKey('biblical_reference')) {
      context.handle(
        _biblicalReferenceMeta,
        biblicalReference.isAcceptableOrUnknown(
          data['biblical_reference']!,
          _biblicalReferenceMeta,
        ),
      );
    }
    if (data.containsKey('previous_days')) {
      context.handle(
        _previousDaysMeta,
        previousDays.isAcceptableOrUnknown(
          data['previous_days']!,
          _previousDaysMeta,
        ),
      );
    }
    if (data.containsKey('future_days')) {
      context.handle(
        _futureDaysMeta,
        futureDays.isAcceptableOrUnknown(data['future_days']!, _futureDaysMeta),
      );
    }
    if (data.containsKey('daily_notification_enabled')) {
      context.handle(
        _dailyNotificationEnabledMeta,
        dailyNotificationEnabled.isAcceptableOrUnknown(
          data['daily_notification_enabled']!,
          _dailyNotificationEnabledMeta,
        ),
      );
    }
    if (data.containsKey('daily_notification_hour')) {
      context.handle(
        _dailyNotificationHourMeta,
        dailyNotificationHour.isAcceptableOrUnknown(
          data['daily_notification_hour']!,
          _dailyNotificationHourMeta,
        ),
      );
    }
    if (data.containsKey('daily_notification_minute')) {
      context.handle(
        _dailyNotificationMinuteMeta,
        dailyNotificationMinute.isAcceptableOrUnknown(
          data['daily_notification_minute']!,
          _dailyNotificationMinuteMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fontSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}font_size'],
      )!,
      continuousReading: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}continuous_reading'],
      )!,
      biblicalReference: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}biblical_reference'],
      )!,
      previousDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_days'],
      )!,
      futureDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}future_days'],
      )!,
      dailyNotificationEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}daily_notification_enabled'],
      )!,
      dailyNotificationHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_notification_hour'],
      )!,
      dailyNotificationMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_notification_minute'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final int fontSize;
  final bool continuousReading;
  final bool biblicalReference;
  final int previousDays;
  final int futureDays;
  final bool dailyNotificationEnabled;
  final int dailyNotificationHour;
  final int dailyNotificationMinute;
  const Setting({
    required this.id,
    required this.fontSize,
    required this.continuousReading,
    required this.biblicalReference,
    required this.previousDays,
    required this.futureDays,
    required this.dailyNotificationEnabled,
    required this.dailyNotificationHour,
    required this.dailyNotificationMinute,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['font_size'] = Variable<int>(fontSize);
    map['continuous_reading'] = Variable<bool>(continuousReading);
    map['biblical_reference'] = Variable<bool>(biblicalReference);
    map['previous_days'] = Variable<int>(previousDays);
    map['future_days'] = Variable<int>(futureDays);
    map['daily_notification_enabled'] = Variable<bool>(
      dailyNotificationEnabled,
    );
    map['daily_notification_hour'] = Variable<int>(dailyNotificationHour);
    map['daily_notification_minute'] = Variable<int>(dailyNotificationMinute);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      fontSize: Value(fontSize),
      continuousReading: Value(continuousReading),
      biblicalReference: Value(biblicalReference),
      previousDays: Value(previousDays),
      futureDays: Value(futureDays),
      dailyNotificationEnabled: Value(dailyNotificationEnabled),
      dailyNotificationHour: Value(dailyNotificationHour),
      dailyNotificationMinute: Value(dailyNotificationMinute),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      fontSize: serializer.fromJson<int>(json['fontSize']),
      continuousReading: serializer.fromJson<bool>(json['continuousReading']),
      biblicalReference: serializer.fromJson<bool>(json['biblicalReference']),
      previousDays: serializer.fromJson<int>(json['previousDays']),
      futureDays: serializer.fromJson<int>(json['futureDays']),
      dailyNotificationEnabled: serializer.fromJson<bool>(
        json['dailyNotificationEnabled'],
      ),
      dailyNotificationHour: serializer.fromJson<int>(
        json['dailyNotificationHour'],
      ),
      dailyNotificationMinute: serializer.fromJson<int>(
        json['dailyNotificationMinute'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fontSize': serializer.toJson<int>(fontSize),
      'continuousReading': serializer.toJson<bool>(continuousReading),
      'biblicalReference': serializer.toJson<bool>(biblicalReference),
      'previousDays': serializer.toJson<int>(previousDays),
      'futureDays': serializer.toJson<int>(futureDays),
      'dailyNotificationEnabled': serializer.toJson<bool>(
        dailyNotificationEnabled,
      ),
      'dailyNotificationHour': serializer.toJson<int>(dailyNotificationHour),
      'dailyNotificationMinute': serializer.toJson<int>(
        dailyNotificationMinute,
      ),
    };
  }

  Setting copyWith({
    int? id,
    int? fontSize,
    bool? continuousReading,
    bool? biblicalReference,
    int? previousDays,
    int? futureDays,
    bool? dailyNotificationEnabled,
    int? dailyNotificationHour,
    int? dailyNotificationMinute,
  }) => Setting(
    id: id ?? this.id,
    fontSize: fontSize ?? this.fontSize,
    continuousReading: continuousReading ?? this.continuousReading,
    biblicalReference: biblicalReference ?? this.biblicalReference,
    previousDays: previousDays ?? this.previousDays,
    futureDays: futureDays ?? this.futureDays,
    dailyNotificationEnabled:
        dailyNotificationEnabled ?? this.dailyNotificationEnabled,
    dailyNotificationHour: dailyNotificationHour ?? this.dailyNotificationHour,
    dailyNotificationMinute:
        dailyNotificationMinute ?? this.dailyNotificationMinute,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      fontSize: data.fontSize.present ? data.fontSize.value : this.fontSize,
      continuousReading: data.continuousReading.present
          ? data.continuousReading.value
          : this.continuousReading,
      biblicalReference: data.biblicalReference.present
          ? data.biblicalReference.value
          : this.biblicalReference,
      previousDays: data.previousDays.present
          ? data.previousDays.value
          : this.previousDays,
      futureDays: data.futureDays.present
          ? data.futureDays.value
          : this.futureDays,
      dailyNotificationEnabled: data.dailyNotificationEnabled.present
          ? data.dailyNotificationEnabled.value
          : this.dailyNotificationEnabled,
      dailyNotificationHour: data.dailyNotificationHour.present
          ? data.dailyNotificationHour.value
          : this.dailyNotificationHour,
      dailyNotificationMinute: data.dailyNotificationMinute.present
          ? data.dailyNotificationMinute.value
          : this.dailyNotificationMinute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('fontSize: $fontSize, ')
          ..write('continuousReading: $continuousReading, ')
          ..write('biblicalReference: $biblicalReference, ')
          ..write('previousDays: $previousDays, ')
          ..write('futureDays: $futureDays, ')
          ..write('dailyNotificationEnabled: $dailyNotificationEnabled, ')
          ..write('dailyNotificationHour: $dailyNotificationHour, ')
          ..write('dailyNotificationMinute: $dailyNotificationMinute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fontSize,
    continuousReading,
    biblicalReference,
    previousDays,
    futureDays,
    dailyNotificationEnabled,
    dailyNotificationHour,
    dailyNotificationMinute,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.fontSize == this.fontSize &&
          other.continuousReading == this.continuousReading &&
          other.biblicalReference == this.biblicalReference &&
          other.previousDays == this.previousDays &&
          other.futureDays == this.futureDays &&
          other.dailyNotificationEnabled == this.dailyNotificationEnabled &&
          other.dailyNotificationHour == this.dailyNotificationHour &&
          other.dailyNotificationMinute == this.dailyNotificationMinute);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<int> fontSize;
  final Value<bool> continuousReading;
  final Value<bool> biblicalReference;
  final Value<int> previousDays;
  final Value<int> futureDays;
  final Value<bool> dailyNotificationEnabled;
  final Value<int> dailyNotificationHour;
  final Value<int> dailyNotificationMinute;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.fontSize = const Value.absent(),
    this.continuousReading = const Value.absent(),
    this.biblicalReference = const Value.absent(),
    this.previousDays = const Value.absent(),
    this.futureDays = const Value.absent(),
    this.dailyNotificationEnabled = const Value.absent(),
    this.dailyNotificationHour = const Value.absent(),
    this.dailyNotificationMinute = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.fontSize = const Value.absent(),
    this.continuousReading = const Value.absent(),
    this.biblicalReference = const Value.absent(),
    this.previousDays = const Value.absent(),
    this.futureDays = const Value.absent(),
    this.dailyNotificationEnabled = const Value.absent(),
    this.dailyNotificationHour = const Value.absent(),
    this.dailyNotificationMinute = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<int>? fontSize,
    Expression<bool>? continuousReading,
    Expression<bool>? biblicalReference,
    Expression<int>? previousDays,
    Expression<int>? futureDays,
    Expression<bool>? dailyNotificationEnabled,
    Expression<int>? dailyNotificationHour,
    Expression<int>? dailyNotificationMinute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fontSize != null) 'font_size': fontSize,
      if (continuousReading != null) 'continuous_reading': continuousReading,
      if (biblicalReference != null) 'biblical_reference': biblicalReference,
      if (previousDays != null) 'previous_days': previousDays,
      if (futureDays != null) 'future_days': futureDays,
      if (dailyNotificationEnabled != null)
        'daily_notification_enabled': dailyNotificationEnabled,
      if (dailyNotificationHour != null)
        'daily_notification_hour': dailyNotificationHour,
      if (dailyNotificationMinute != null)
        'daily_notification_minute': dailyNotificationMinute,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? fontSize,
    Value<bool>? continuousReading,
    Value<bool>? biblicalReference,
    Value<int>? previousDays,
    Value<int>? futureDays,
    Value<bool>? dailyNotificationEnabled,
    Value<int>? dailyNotificationHour,
    Value<int>? dailyNotificationMinute,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      fontSize: fontSize ?? this.fontSize,
      continuousReading: continuousReading ?? this.continuousReading,
      biblicalReference: biblicalReference ?? this.biblicalReference,
      previousDays: previousDays ?? this.previousDays,
      futureDays: futureDays ?? this.futureDays,
      dailyNotificationEnabled:
          dailyNotificationEnabled ?? this.dailyNotificationEnabled,
      dailyNotificationHour:
          dailyNotificationHour ?? this.dailyNotificationHour,
      dailyNotificationMinute:
          dailyNotificationMinute ?? this.dailyNotificationMinute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fontSize.present) {
      map['font_size'] = Variable<int>(fontSize.value);
    }
    if (continuousReading.present) {
      map['continuous_reading'] = Variable<bool>(continuousReading.value);
    }
    if (biblicalReference.present) {
      map['biblical_reference'] = Variable<bool>(biblicalReference.value);
    }
    if (previousDays.present) {
      map['previous_days'] = Variable<int>(previousDays.value);
    }
    if (futureDays.present) {
      map['future_days'] = Variable<int>(futureDays.value);
    }
    if (dailyNotificationEnabled.present) {
      map['daily_notification_enabled'] = Variable<bool>(
        dailyNotificationEnabled.value,
      );
    }
    if (dailyNotificationHour.present) {
      map['daily_notification_hour'] = Variable<int>(
        dailyNotificationHour.value,
      );
    }
    if (dailyNotificationMinute.present) {
      map['daily_notification_minute'] = Variable<int>(
        dailyNotificationMinute.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('fontSize: $fontSize, ')
          ..write('continuousReading: $continuousReading, ')
          ..write('biblicalReference: $biblicalReference, ')
          ..write('previousDays: $previousDays, ')
          ..write('futureDays: $futureDays, ')
          ..write('dailyNotificationEnabled: $dailyNotificationEnabled, ')
          ..write('dailyNotificationHour: $dailyNotificationHour, ')
          ..write('dailyNotificationMinute: $dailyNotificationMinute')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LiturgiesTable liturgies = $LiturgiesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [liturgies, settings];
}

typedef $$LiturgiesTableCreateCompanionBuilder =
    LiturgiesCompanion Function({
      required String date,
      required String json,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$LiturgiesTableUpdateCompanionBuilder =
    LiturgiesCompanion Function({
      Value<String> date,
      Value<String> json,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$LiturgiesTableFilterComposer
    extends Composer<_$AppDatabase, $LiturgiesTable> {
  $$LiturgiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LiturgiesTableOrderingComposer
    extends Composer<_$AppDatabase, $LiturgiesTable> {
  $$LiturgiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LiturgiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LiturgiesTable> {
  $$LiturgiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LiturgiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LiturgiesTable,
          Liturgy,
          $$LiturgiesTableFilterComposer,
          $$LiturgiesTableOrderingComposer,
          $$LiturgiesTableAnnotationComposer,
          $$LiturgiesTableCreateCompanionBuilder,
          $$LiturgiesTableUpdateCompanionBuilder,
          (Liturgy, BaseReferences<_$AppDatabase, $LiturgiesTable, Liturgy>),
          Liturgy,
          PrefetchHooks Function()
        > {
  $$LiturgiesTableTableManager(_$AppDatabase db, $LiturgiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LiturgiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LiturgiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LiturgiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> date = const Value.absent(),
                Value<String> json = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LiturgiesCompanion(
                date: date,
                json: json,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String date,
                required String json,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LiturgiesCompanion.insert(
                date: date,
                json: json,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LiturgiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LiturgiesTable,
      Liturgy,
      $$LiturgiesTableFilterComposer,
      $$LiturgiesTableOrderingComposer,
      $$LiturgiesTableAnnotationComposer,
      $$LiturgiesTableCreateCompanionBuilder,
      $$LiturgiesTableUpdateCompanionBuilder,
      (Liturgy, BaseReferences<_$AppDatabase, $LiturgiesTable, Liturgy>),
      Liturgy,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int> fontSize,
      Value<bool> continuousReading,
      Value<bool> biblicalReference,
      Value<int> previousDays,
      Value<int> futureDays,
      Value<bool> dailyNotificationEnabled,
      Value<int> dailyNotificationHour,
      Value<int> dailyNotificationMinute,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int> fontSize,
      Value<bool> continuousReading,
      Value<bool> biblicalReference,
      Value<int> previousDays,
      Value<int> futureDays,
      Value<bool> dailyNotificationEnabled,
      Value<int> dailyNotificationHour,
      Value<int> dailyNotificationMinute,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get continuousReading => $composableBuilder(
    column: $table.continuousReading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get biblicalReference => $composableBuilder(
    column: $table.biblicalReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get previousDays => $composableBuilder(
    column: $table.previousDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get futureDays => $composableBuilder(
    column: $table.futureDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dailyNotificationEnabled => $composableBuilder(
    column: $table.dailyNotificationEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyNotificationHour => $composableBuilder(
    column: $table.dailyNotificationHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyNotificationMinute => $composableBuilder(
    column: $table.dailyNotificationMinute,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get continuousReading => $composableBuilder(
    column: $table.continuousReading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get biblicalReference => $composableBuilder(
    column: $table.biblicalReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get previousDays => $composableBuilder(
    column: $table.previousDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get futureDays => $composableBuilder(
    column: $table.futureDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dailyNotificationEnabled => $composableBuilder(
    column: $table.dailyNotificationEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyNotificationHour => $composableBuilder(
    column: $table.dailyNotificationHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyNotificationMinute => $composableBuilder(
    column: $table.dailyNotificationMinute,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get fontSize =>
      $composableBuilder(column: $table.fontSize, builder: (column) => column);

  GeneratedColumn<bool> get continuousReading => $composableBuilder(
    column: $table.continuousReading,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get biblicalReference => $composableBuilder(
    column: $table.biblicalReference,
    builder: (column) => column,
  );

  GeneratedColumn<int> get previousDays => $composableBuilder(
    column: $table.previousDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get futureDays => $composableBuilder(
    column: $table.futureDays,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get dailyNotificationEnabled => $composableBuilder(
    column: $table.dailyNotificationEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyNotificationHour => $composableBuilder(
    column: $table.dailyNotificationHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyNotificationMinute => $composableBuilder(
    column: $table.dailyNotificationMinute,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> fontSize = const Value.absent(),
                Value<bool> continuousReading = const Value.absent(),
                Value<bool> biblicalReference = const Value.absent(),
                Value<int> previousDays = const Value.absent(),
                Value<int> futureDays = const Value.absent(),
                Value<bool> dailyNotificationEnabled = const Value.absent(),
                Value<int> dailyNotificationHour = const Value.absent(),
                Value<int> dailyNotificationMinute = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                fontSize: fontSize,
                continuousReading: continuousReading,
                biblicalReference: biblicalReference,
                previousDays: previousDays,
                futureDays: futureDays,
                dailyNotificationEnabled: dailyNotificationEnabled,
                dailyNotificationHour: dailyNotificationHour,
                dailyNotificationMinute: dailyNotificationMinute,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> fontSize = const Value.absent(),
                Value<bool> continuousReading = const Value.absent(),
                Value<bool> biblicalReference = const Value.absent(),
                Value<int> previousDays = const Value.absent(),
                Value<int> futureDays = const Value.absent(),
                Value<bool> dailyNotificationEnabled = const Value.absent(),
                Value<int> dailyNotificationHour = const Value.absent(),
                Value<int> dailyNotificationMinute = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                fontSize: fontSize,
                continuousReading: continuousReading,
                biblicalReference: biblicalReference,
                previousDays: previousDays,
                futureDays: futureDays,
                dailyNotificationEnabled: dailyNotificationEnabled,
                dailyNotificationHour: dailyNotificationHour,
                dailyNotificationMinute: dailyNotificationMinute,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LiturgiesTableTableManager get liturgies =>
      $$LiturgiesTableTableManager(_db, _db.liturgies);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
