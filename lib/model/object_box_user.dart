import 'package:db_benchmarks/interface/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ObjBoxUserModel implements User {
  int id;
  final DateTime createdAt;
  final String username;
  final String email;
  final int age;

  ObjBoxUserModel({
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
