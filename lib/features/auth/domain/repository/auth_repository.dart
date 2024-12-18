import 'package:clean_architecture_blogs/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginWithEmailandPassword({
    required String email,
    required String password,
  });
}
