import 'package:db_benchmarks/interface/benchmark.dart';

class Result {
  final Benchmark benchmark;
  final bool optimised;
  int timeElapsed = 0;

  Result(this.benchmark, this.optimised);
}
