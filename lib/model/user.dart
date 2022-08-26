import 'package:db_benchmarks/interface/user.dart';

class UserModel implements User {
  final int id;
  final DateTime createdAt;
  final String username;
  final String email;
  final int age;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.username,
    required this.email,
    required this.age,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      createdAt: map['createdAt'],
      username: map['username'],
      email: map['email'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt.toIso8601String(),
      'username': this.username,
      'email': this.email,
      'age': this.age,
    };
  }
}
