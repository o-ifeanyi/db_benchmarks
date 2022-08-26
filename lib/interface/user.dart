abstract class User {
  int get id;
  DateTime get createdAt;
  String get username;
  String get email;
  int get age;

  Map<String, dynamic> toMap();
}
