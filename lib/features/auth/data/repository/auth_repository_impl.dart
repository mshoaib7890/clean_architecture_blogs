import 'package:clean_architecture_blogs/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_blogs/core/error/exception.dart';
import 'package:clean_architecture_blogs/core/error/failure.dart';
import 'package:clean_architecture_blogs/features/auth/data/datasource/auth_supabase_data.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Implementing the AuthRepository interface
  final AuthSupabaseData authSupabaseData;

  AuthRepositoryImpl(this.authSupabaseData);

  @override
  Future<Either<Failure, String>> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authSupabaseData.signUpwithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> loginWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authSupabaseData.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure("Unexpected error: ${e.toString()}"));
    }
  }
}