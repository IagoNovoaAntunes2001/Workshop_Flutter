import 'package:palestra_introducao/repository/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'teste.1.db');
  return openDatabase(path, onCreate: (db, version) async {
    await db.execute('CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, cpf TEXT)');
  },
    version: 1,
  );
}

Future<int> save(String table, User user) async {
  final Database db = await getDatabase();
  Map<String, dynamic> userMap = _toMap(user);
  return db.insert(table, userMap);
}

Future<List<Map>> findAll(String table) async {
  final Database db = await getDatabase();
  List<Map> list = await db.rawQuery('SELECT * FROM $table');
  print(list);
  return list;
}

Map<String, dynamic> _toMap(User user) {
  Map<String, dynamic> userMap = new Map();
  userMap['name'] = user.name;
  userMap['email'] = user.email;
  userMap['cpf'] = user.cpf;
  return userMap;
}
