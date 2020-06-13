import 'package:palestra_introducao/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICache {
  Future<int> save(String table, User row);

  Future<List<Map>> find(String table);
}

class BaseCache implements ICache {
  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'teste.1.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, cpf TEXT)');
      },
      version: 1,
    );
  }

  @override
  Future<List<Map>> find(String table) async {
    final Database db = await getDatabase();
    return await db.rawQuery('SELECT * FROM $table');
  }

  @override
  Future<int> save(String table, User row) async {
    final Database db = await getDatabase();
    return await db.insert(table, row.toJson());
  }
}
