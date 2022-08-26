import 'package:db_benchmarks/interface/user.dart';

enum BenchmarkType { write, read, delete }

abstract class Benchmark {
  String get name;

  Future<void> setUp();
  Future<void> tearDown();

  List<User> generateUsers(int count);
  Future<int> writeUsers(List<User> users, bool optimise);
  Future<int> readUsers(List<User> users, bool optimise);
  Future<int> deleteUsers(List<User> users, bool optimise);
}
