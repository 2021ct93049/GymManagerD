// Alternate database implementation using drift
import 'db/database.dart';

class DriftDb {
  DriftDb._internal();
  static final DriftDb _db = DriftDb._internal();
  static DriftDb get instance => _db;
  static GymDatabase? _database;

  GymDatabase get database {
    if (_database != null) return _database!;
    _database = GymDatabase();
    return _database!;
  }
}
