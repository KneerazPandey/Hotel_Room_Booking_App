import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
    };
  }

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
