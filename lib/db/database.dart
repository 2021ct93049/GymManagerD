import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;

// Generated by drift_dev when running `build_runner build`
part 'database.g.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get start => text()();
  TextColumn get end => text()();
}

@DriftDatabase(tables: [Members])
class GymDatabase extends _$GymDatabase {
  GymDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;
}
