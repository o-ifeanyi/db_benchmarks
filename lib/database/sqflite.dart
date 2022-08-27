import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SqfliteDBImpl implements Benchmark {
  late Database db;
  static const String USER_TABLE = "users";

  @override
  String get name => 'Sqflite';

  @override
  Future<void> setUp() async {
    var dir = await getApplicationDocumentsDirectory();
    var dbPath = path.join(dir.path, 'sqlite.db');
    if (await File(dbPath).exists()) {
      await File(dbPath).delete();
    }

    db = await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $USER_TABLE (id TEXT PRIMARY KEY, createdAt TEXT, username TEXT, email TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    db.delete(USER_TABLE); // delete all users in the table
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (var user in users) {
      await db.query(
        USER_TABLE,
        where: "id = ?",
        whereArgs: [user.id],
      );
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (var user in users) {
      await db.insert(
        USER_TABLE,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (var user in users) {
      await db.delete(
        USER_TABLE,
        where: "id = ?",
        whereArgs: [user.id],
      );
    }
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
}
