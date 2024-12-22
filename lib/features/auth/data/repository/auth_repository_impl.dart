import 'package:clean_architecture_blogs/features/auth/domain/entity/user.dart';
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
  Future<Either<Failure, User>> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authSupabaseData.signUpwithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user as User);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authSupabaseData.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return right(user as User);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure("Unexpected error: ${e.toString()}"));
    }
  }
}
