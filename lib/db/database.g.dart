// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<String> start = GeneratedColumn<String>(
      'start', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<String> end = GeneratedColumn<String>(
      'end', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, start, end];
  @override
  String get aliasedName => _alias ?? 'members';
  @override
  String get actualTableName => 'members';
  @override
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end'])!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String name;
  final String email;
  final String start;
  final String end;
  const Member(
      {required this.id,
      required this.name,
      required this.email,
      required this.start,
      required this.end});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['start'] = Variable<String>(start);
    map['end'] = Variable<String>(end);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      start: Value(start),
      end: Value(end),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      start: serializer.fromJson<String>(json['start']),
      end: serializer.fromJson<String>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'start': serializer.toJson<String>(start),
      'end': serializer.toJson<String>(end),
    };
  }

  Member copyWith(
          {int? id, String? name, String? email, String? start, String? end}) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        start: start ?? this.start,
        end: end ?? this.end,
      );
  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, start, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.start == this.start &&
          other.end == this.end);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> start;
  final Value<String> end;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String start,
    required String end,
  })  : name = Value(name),
        email = Value(email),
        start = Value(start),
        end = Value(end);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? start,
    Expression<String>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    });
  }

  MembersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? start,
      Value<String>? end}) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (start.present) {
      map['start'] = Variable<String>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<String>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

abstract class _$GymDatabase extends GeneratedDatabase {
  _$GymDatabase(QueryExecutor e) : super(e);
  late final $MembersTable members = $MembersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [members];
}
