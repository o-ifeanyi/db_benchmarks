import 'package:db_benchmarks/model/result.dart';
import 'package:flutter/material.dart';

class BenchmarkResult extends StatelessWidget {
  final double width = 12;

  final List<Result> results;

  BenchmarkResult(this.results);

  List<String> get labels {
    return results.map((r) => r.benchmark.name).toList();
  }

  int get maxResultTime {
    var max = 1;
    for (var result in results) {
      if (result.timeElapsed > max) {
        max = result.timeElapsed;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: results.map((e) {
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.benchmark.name),
                  Text('${e.timeElapsed}ms'),
                ],
              ),
              SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: e.timeElapsed.toDouble() / maxResultTime,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      }).toList(),
    );
  }
}
