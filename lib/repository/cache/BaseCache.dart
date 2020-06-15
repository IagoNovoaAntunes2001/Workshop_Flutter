import 'package:palestra_introducao/model/user/UserRequest.dart';
import 'package:palestra_introducao/model/user/UserResult.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICache {
  Future<int> save(String table, UserRequest row);

  Future<List<UserResult>> find(String table);
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
  Future<List<UserResult>> find(String table) async {
    final Database db = await getDatabase();
    var result = await db.rawQuery('SELECT * FROM $table');
    return result.map((f) => UserResult.fromJson(f)).toList();
  }

  @override
  Future<int> save(String table, UserRequest row) async {
    final Database db = await getDatabase();
    return await db.insert(table, row.toJson());
  }
}
