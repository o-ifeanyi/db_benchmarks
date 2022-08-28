import 'package:db_benchmarks/model/result.dart';

abstract class BenchmarkRunner {
  Future<List<Result>> benchmarkWrite(int count);
  Future<List<Result>> benchmarkDelete(int count);
  Future<List<Result>> benchmarkRead(int count);
  Future<List<Result>> benchmarkSize(int count);
}
