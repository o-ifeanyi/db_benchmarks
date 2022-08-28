import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/model/result.dart';
import 'package:flutter/material.dart';

class BenchmarkResult extends StatelessWidget {
  final double width = 12;

  final Map<BenchmarkType, List<Result>> benchmarks;

  BenchmarkResult(this.benchmarks);

  int maxResultTime(List<Result> results) {
    var max = 1;
    for (var result in results) {
      if (result.timeElapsed > max) {
        max = result.timeElapsed;
      }
    }
    return max;
  }

  int maxDbSize(List<Result> results) {
    var max = 1;
    for (var result in results) {
      if (result.dbSize > max) {
        max = result.dbSize;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: benchmarks.keys.map(
        (bType) {
          final isSize = bType == BenchmarkType.size;
          final results = benchmarks[bType] ?? [];
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  bType.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ...results.map(
                  (e) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.benchmark.name),
                            isSize
                                ? Text('${e.databaseSize}mb')
                                : Text('${e.timeElapsed}ms'),
                          ],
                        ),
                        SizedBox(height: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: LinearProgressIndicator(
                            minHeight: 8,
                            value: isSize
                                ? e.dbSize.toDouble() / maxDbSize(results)
                                : e.timeElapsed.toDouble() /
                                    maxResultTime(results),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
