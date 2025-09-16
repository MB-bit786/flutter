import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await setDatabase();
    return _database!;
  }

  Future<Database> setDatabase() async {
    String path = join(await getDatabasesPath(), "tasks.db");
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT,
          date TEXT,
          time TEXT,
          priority TEXT,
          isCompleted INTEGER
        )
      ''');
    });
  }
}