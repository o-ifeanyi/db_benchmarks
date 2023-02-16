import 'dart:io';

import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/user.dart';
import 'package:db_benchmarks/model/object_box_user.dart';
import 'package:db_benchmarks/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxDBImpl implements Benchmark {
  late Store store;
  late Box<ObjBoxUserModel> box;
  @override
  String get name => 'Object box';

  @override
  Future<void> setUp() async {
    final dir = await getApplicationDocumentsDirectory();

    store = await openStore(directory: dir.path);
    box = store.box<ObjBoxUserModel>();
    box.removeAll(); // delete all users in the box
  }

  @override
  Future<void> tearDown() async {
    store.close();
  }

  @override
  Future<int> readUsers(List<User> users, bool optimise) async {
    final s = Stopwatch()..start();
    if (optimise) {
      final ids = users.map((e) => e.id).toList();
      box.getMany(ids);
    } else {
      for (var user in users) {
        box.get(user.id);
      }
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> writeUsers(List<User> users, bool optimise) async {
    final castUsers = List.castFrom<User, ObjBoxUserModel>(users);
    var s = Stopwatch()..start();
    if (optimise) {
      box.putMany(castUsers);
    } else {
      for (var user in castUsers) {
        box.put(user);
      }
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteUsers(List<User> users, bool optimise) async {
    var s = Stopwatch()..start();
    if (optimise) {
      final ids = users.map((e) => e.id).toList();
      box.removeMany(ids);
    } else {
      for (var user in users) {
        box.remove(user.id);
      }
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  List<User> generateUsers(int count) {
    return List.generate(
      count,
      (_) => ObjBoxUserModel(
        id: 0,
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
        .listSync(recursive: true)
        .where((file) => file.path.toLowerCase().endsWith('.mdb'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }
}
