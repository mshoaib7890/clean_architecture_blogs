import 'package:clean_architecture_blogs/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthSupabaseData {
  Future<String> signUpwithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthSupabaseDataImpl implements AuthSupabaseData {
  final SupabaseClient supabaseClient;

  AuthSupabaseDataImpl(this.supabaseClient);

  @override
  Future<String> signUpwithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name}, // Custom metadata
      );

      if (response.user == null) {
        throw const ServerException('Sign up failed: User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException('SignUp Error: ${e.toString()}');
    }
  }

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Use the latest Supabase login method
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const ServerException('Login failed: User is null');
      }

      // Successfully logged in user
      final userId = response.user!.id;
      print('Login Success: User ID: $userId');
      return userId;
    } catch (e) {
      throw ServerException('Login Error: ${e.toString()}');
    }
  }
}
