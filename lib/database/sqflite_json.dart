import 'dart:convert';
import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as path;

class SqfliteJsonDBImpl implements Benchmark {
  late Database db;
  static const String USER_TABLE = "users";

  @override
  String get name => 'Sqflite (JSON1)';

  @override
  Future<void> setUp() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, 'sqlite-json1.db');

    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;

    db = await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $USER_TABLE (id TEXT PRIMARY KEY, createdAt TEXT, username TEXT, email TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    await db.rawQuery('PRAGMA journal_mode = WAL');
    await db.rawQuery('PRAGMA synchronous = NORMAL');
    await db.rawQuery('PRAGMA locking_mode = EXCLUSIVE');
    await db.delete(USER_TABLE); // delete all users in the table
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    final ids = users.map((e) => e.id).toList();
    await db.query(USER_TABLE,
        where: "id IN (SELECT json_each.value FROM json_each(?))",
        whereArgs: [jsonEncode(ids)]);
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    String encoded = jsonEncode([for (var u in users) u.toMap()]);
    await db.transaction((txn) async {
      await txn.rawInsert(
          """INSERT INTO $USER_TABLE(id, createdAt, username, email, age)
          SELECT 
            json_extract(json_each.value, '\$.id'),
            json_extract(json_each.value, '\$.createdAt'),
            json_extract(json_each.value, '\$.username'),
            json_extract(json_each.value, '\$.email'),
            json_extract(json_each.value, '\$.age')
          FROM json_each(?)
                  """, [encoded]);
    });
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    final ids = users.map((e) => e.id).toList();
    await db.delete(
      USER_TABLE,
      where: "id IN (SELECT json_each.value FROM json_each(?))",
      whereArgs: [jsonEncode(ids)],
    );
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  List<User> generateUsers(int count) {
    return List.generate(
      count,
      (index) => UserModel(
        id: index,
        createdAt: DateTime.now(),
        username: 'username',
        email: 'email',
        age: 25,
      ),
    );
  }

  @override
  Future<int> getDbSize() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir
        .listSync()
        .where((file) => file.path.toLowerCase().contains('sqlite-json1'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }
}
