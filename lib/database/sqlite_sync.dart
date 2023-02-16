import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as path;

class SqliteSyncDBImpl implements Benchmark {
  late Database db;
  static const String USER_TABLE = "users";

  @override
  String get name => 'Sqlite (Sync)';

  @override
  Future<void> setUp() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, 'sqlite-sync.db');

    db = sqlite3.open(dbPath);
    db.execute('PRAGMA journal_mode = WAL');
    db.execute('PRAGMA synchronous = NORMAL');
    db.execute('PRAGMA locking_mode = EXCLUSIVE');

    db.execute(
        'CREATE TABLE IF NOT EXISTS $USER_TABLE (id TEXT PRIMARY KEY, createdAt TEXT, username TEXT, email TEXT, age INTEGER)');
    db.execute(
        'DELETE FROM $USER_TABLE WHERE 1'); // delete all users in the table
  }

  @override
  Future<void> tearDown() async {
    db.dispose();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    var stmt = db.prepare("SELECT * FROM $USER_TABLE WHERE id = ? LIMIT 1");
    db.execute('BEGIN');
    try {
      for (var user in users) {
        stmt.execute([user.id]);
      }
      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      rethrow;
    } finally {
      stmt.dispose();
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    db.execute('BEGIN EXCLUSIVE');
    var stmt = db
        .prepare("""INSERT INTO $USER_TABLE(id, createdAt, username, email, age)
              VALUES(?, ?, ?, ?, ?)""");
    try {
      for (var user in users) {
        stmt.execute([
          user.id,
          user.createdAt.toIso8601String(),
          user.username,
          user.email,
          user.age
        ]);
      }
      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      rethrow;
    } finally {
      stmt.dispose();
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    db.execute('BEGIN EXCLUSIVE');
    var stmt = db.prepare("""DELETE FROM $USER_TABLE WHERE id = ?""");
    try {
      for (var user in users) {
        stmt.execute([user.id]);
      }
      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      rethrow;
    } finally {
      stmt.dispose();
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
        .where((file) => file.path.toLowerCase().contains('sqlite-sync'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }
}
