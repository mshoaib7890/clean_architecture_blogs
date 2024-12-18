import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.appMetadata,
    required super.userMetadata,
    required super.aud,
    required super.createdAt,
  });
}
