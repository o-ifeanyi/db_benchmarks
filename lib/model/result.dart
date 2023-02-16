import 'package:db_benchmarks/interface/benchmark.dart';

class Result {
  final Benchmark benchmark;
  final bool optimised;
  int timeElapsed = 0;
  int dbSize = 0;

  String get databaseSize {
    return (dbSize / 1024 / 1024).toStringAsFixed(2);
  }

  Result(this.benchmark, this.optimised);
}
