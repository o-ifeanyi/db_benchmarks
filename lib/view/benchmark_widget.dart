import 'package:db_benchmarks/database/hive.dart';
import 'package:db_benchmarks/database/isar.dart';
import 'package:db_benchmarks/database/object_box.dart';
import 'package:db_benchmarks/database/sembast.dart';
import 'package:db_benchmarks/database/sqflite.dart';
import 'package:db_benchmarks/interface/benchmark.dart';
import 'package:db_benchmarks/model/result.dart';
import 'package:db_benchmarks/runner/benchmark_runner_impl.dart';
import 'package:db_benchmarks/view/benchmark_result.dart';
import 'package:flutter/material.dart';

class BenchmarkWidget extends StatefulWidget {
  @override
  _BenchmarkWidgetState createState() => _BenchmarkWidgetState();
}

class _BenchmarkWidgetState extends State<BenchmarkWidget> {
  static const entrySteps = [10, 20, 50, 100, 200, 500, 1000, 2000];
  late List<Benchmark> runners;
  late List<Benchmark> optimisedRunners;
  bool _optimised = false;

  var entryValue = 0.0;
  int get entries => entrySteps[entryValue.round()];

  var benchmarkRunning = false;
  Map<BenchmarkType, List<Result>>? benchmarkResults;

  @override
  void initState() {
    super.initState();
    runners = [
      HiveDBImpl(),
      SembasDBImpl(),
      SqfliteDBImpl(),
      ObjectBoxDBImpl(),
      IsarDBImpl(),
    ];
    optimisedRunners = [
      HiveDBImpl(),
      SqfliteDBImpl(),
      ObjectBoxDBImpl(),
      IsarDBImpl(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DB Benchmarks",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        entries.toString() + " Entries",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Optimise ?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                          activeColor: Colors.blue,
                          value: _optimised,
                          onChanged: (val) {
                            if (val == null) return;
                            setState(() {
                              _optimised = val;
                            });
                          })
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Slider(
                  value: entryValue,
                  min: 0,
                  max: (entrySteps.length - 1).toDouble(),
                  divisions: entrySteps.length - 1,
                  onChanged: (newValue) {
                    setState(() {
                      entryValue = newValue;
                    });
                  },
                ),
                if (benchmarkResults == null)
                  Center(
                    child: Text('Run benchmark to show data'),
                  )
                else
                  BenchmarkResult(benchmarkResults!),
                SizedBox(height: 100),
              ],
            ),
          ),
          if (benchmarkRunning)
            Container(
              color: Colors.black38,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: CircularProgressIndicator(),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: benchmarkRunning ? null : _performBenchmark,
        child: Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }

  _performBenchmark() async {
    final _benchmarkRunner = BenchmarkRunnerImpl(
      _optimised ? optimisedRunners : runners,
      _optimised,
    );
    var entries = this.entries;
    setState(() {
      benchmarkRunning = true;
    });

    Map<BenchmarkType, List<Result>> results = {};
    for (BenchmarkType type in BenchmarkType.values) {
      switch (type) {
        case BenchmarkType.write:
          results[type] = await _benchmarkRunner.benchmarkWrite(entries);
          break;
        case BenchmarkType.read:
          results[type] = await _benchmarkRunner.benchmarkRead(entries);
          break;
        case BenchmarkType.delete:
          results[type] = await _benchmarkRunner.benchmarkDelete(entries);
          break;
        case BenchmarkType.size:
          results[type] = await _benchmarkRunner.benchmarkSize(entries);
          break;
      }
    }

    setState(() {
      benchmarkRunning = false;
      benchmarkResults = results;
    });
  }
}
