import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/user.dart';
import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast_io.dart';

class SembasDBImpl implements Benchmark {
  late Database db;
  late StoreRef store;

  @override
  String get name => 'Sembast';

  @override
  Future<void> setUp() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, 'sembast.db');

    db = await databaseFactoryIo.openDatabase(dbPath);
    store = StoreRef('users');
    await store.delete(db); // delete all users in the db
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (final user in users) {
      await store.record(user.id).get(db);
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (final user in users) {
      await store.record(user.id).put(db, user.toMap());
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    for (final user in users) {
      await store.record(user.id).delete(db);
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
        .where((file) => file.path.toLowerCase().contains('sembast'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }
}
