import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/interface/benchmark_runner.dart';
import 'package:db_benchmarks/model/result.dart';

class BenchmarkRunnerImpl implements BenchmarkRunner {
  final List<Benchmark> runners;
  final bool optimized;
  BenchmarkRunnerImpl(this.runners, this.optimized);

  List<Result> _createResults() {
    return runners.map((r) => Result(r, optimized)).toList();
  }

  @override
  Future<List<Result>> benchmarkRead(int count) async {
    final results = _createResults();

    for (var result in results) {
      await result.benchmark.setUp();
      final users = result.benchmark.generateUsers(count);
      await result.benchmark.writeUsers(users, result.optimised);
      result.timeElapsed =
          await result.benchmark.readUsers(users, result.optimised);

      await result.benchmark.tearDown();
    }

    return results;
  }

  @override
  Future<List<Result>> benchmarkWrite(int count) async {
    final results = _createResults();

    for (var result in results) {
      await result.benchmark.setUp();
      final users = result.benchmark.generateUsers(count);
      result.timeElapsed =
          await result.benchmark.writeUsers(users, result.optimised);

      await result.benchmark.tearDown();
    }

    return results;
  }

  @override
  Future<List<Result>> benchmarkDelete(int count) async {
    final results = _createResults();

    for (var result in results) {
      await result.benchmark.setUp();
      final users = result.benchmark.generateUsers(count);
      await result.benchmark.writeUsers(users, result.optimised);
      result.timeElapsed =
          await result.benchmark.deleteUsers(users, result.optimised);

      await result.benchmark.tearDown();
    }

    return results;
  }

  @override
  Future<List<Result>> benchmarkSize(int count) async {
    final results = _createResults();

    for (var result in results) {
      await result.benchmark.setUp();
      final users = result.benchmark.generateUsers(count);
      await result.benchmark.writeUsers(users, result.optimised);
      result.dbSize = await result.benchmark.getDbSize();
      await result.benchmark.tearDown();
    }

    return results;
  }
}
