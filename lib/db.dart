import 'package:gym_manager/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class GymDB {
  GymDB._internal();
  static final GymDB _db = GymDB._internal();
  static GymDB get instance => _db;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    return await openDatabase(p.join(await getDatabasesPath(), 'gym.db'),
        onCreate: ((db, version) => db.execute(
            'CREATE TABLE members(id INTEGER PRIMARY KEY, name TEXT, email TEXT, start TEXT, end TEXT)')),
        version: 5);
  }
}
