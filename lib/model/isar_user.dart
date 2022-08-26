import 'package:db_benchmarks/interface/user.dart';
import 'package:isar/isar.dart';
part 'isar_user.g.dart';

@Collection()
class IsarUserModel implements User {
  int id;
  final DateTime createdAt;
  final String username;
  final String email;
  final int age;

  IsarUserModel({
    this.id = 0,
    required this.createdAt,
    required this.username,
    required this.email,
    required this.age,
  });

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
