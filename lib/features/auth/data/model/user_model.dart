import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.email,
      required super.appMetadata,
      required super.userMetadata,
      required super.aud,
      required super.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      appMetadata: map[''] ?? '',
      userMetadata: map['name'] ?? '',
      aud: map[''] ?? '',
      createdAt: map[''] ?? '',
    );
  }
}
