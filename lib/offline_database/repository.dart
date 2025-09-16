import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class TaskRepository {
  DatabaseConnection _databaseConnection = DatabaseConnection();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.database;
    return _database;
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    var db = await database;
    return await db!.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> getAll(String table) async {
    var db = await database;
    return await db!.query(table, orderBy: "date, time");
  }

  Future<int> update(String table, Map<String, dynamic> data, int id) async {
    var db = await database;
    return await db!.update(table, data, where: "id = ?", whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    var db = await database;
    return await db!.delete(table, where: "id = ?", whereArgs: [id]);
  }
}