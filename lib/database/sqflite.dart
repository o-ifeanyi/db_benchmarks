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
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, 'sqlite.db');

    db = await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $USER_TABLE (id TEXT PRIMARY KEY, createdAt TEXT, username TEXT, email TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    await db.delete(USER_TABLE); // delete all users in the table
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    if (optimise) {
      await db.transaction((txn) async {
        var batch = txn.batch();

        for (var user in users) {
          batch.query(USER_TABLE,
              where: "id = ?", whereArgs: [user.id], limit: 1);
        }
        var results = await batch.apply();
      });
    } else {
      await db.transaction((txn) async {
        for (var user in users) {
          await txn.query(USER_TABLE,
              where: "id = ?", whereArgs: [user.id], limit: 1);
        }
      });
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    if (optimise) {
      await db.transaction((txn) async {
        var batch = txn.batch();
        for (var user in users) {
          batch.insert(USER_TABLE, user.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        await batch.apply(noResult: true);
      });
    } else {
      await db.transaction((txn) async {
        for (var user in users) {
          await txn.insert(
            USER_TABLE,
            user.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    if (optimise) {
      await db.transaction((txn) async {
        var batch = txn.batch();
        for (var user in users) {
          batch.delete(
            USER_TABLE,
            where: "id = ?",
            whereArgs: [user.id],
          );
        }
        await batch.apply();
      });
    } else {
      await db.transaction((txn) async {
        for (var user in users) {
          await txn.delete(
            USER_TABLE,
            where: "id = ?",
            whereArgs: [user.id],
          );
        }
      });
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

  @override
  Future<int> getDbSize() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir
        .listSync()
        .where((file) => file.path.toLowerCase().contains('sqlite'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }
}
