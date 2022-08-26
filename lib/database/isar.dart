import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/isar_user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class IsarDBImpl implements Benchmark {
  late Isar isar;

  @override
  String get name => 'Isar';

  @override
  Future<void> setUp() async {
    var dir = await getApplicationDocumentsDirectory();
    var dbPath = path.join(dir.path, 'isar.db');
    if (await File(dbPath).exists()) {
      await File(dbPath).delete();
    }

    isar = await Isar.open(schemas: [IsarUserModelSchema], directory: dbPath);
  }

  @override
  Future<void> tearDown() async {
    await isar.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    if (optimise) {
      final ids = users.map((e) => e.id).toList();
      var s = Stopwatch()..start();
      await isar.isarUserModels.getAll(ids);
      s.stop();
      return s.elapsedMilliseconds;
    } else {
      var s = Stopwatch()..start();
      for (final user in users) {
        await isar.isarUserModels.get(user.id);
      }
      s.stop();
      return s.elapsedMilliseconds;
    }
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    final castUsers = List.castFrom<User, IsarUserModel>(users);
    if (optimise) {
      var s = Stopwatch()..start();
      await isar.writeTxn((isar) async {
        await isar.isarUserModels.putAll(castUsers);
      });
      s.stop();
      return s.elapsedMilliseconds;
    } else {
      var s = Stopwatch()..start();
      await isar.writeTxn((isar) async {
        for (final user in castUsers) {
          await isar.isarUserModels.put(user);
        }
      });
      s.stop();
      return s.elapsedMilliseconds;
    }
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    if (optimise) {
      final ids = users.map((e) => e.id).toList();
      var s = Stopwatch()..start();
      await isar.writeTxn((isar) async {
        await isar.isarUserModels.deleteAll(ids);
      });
      s.stop();
      return s.elapsedMilliseconds;
    } else {
      var s = Stopwatch()..start();
      await isar.writeTxn((isar) async {
        for (final user in users) {
          await isar.isarUserModels.delete(user.id);
        }
      });
      s.stop();
      return s.elapsedMilliseconds;
    }
  }

  @override
  List<User> generateUsers(int count) {
    return List.generate(
      count,
      (_) => IsarUserModel(
        id: Isar.autoIncrement,
        createdAt: DateTime.now(),
        username: 'username',
        email: 'email',
        age: 25,
      ),
    );
  }
}
