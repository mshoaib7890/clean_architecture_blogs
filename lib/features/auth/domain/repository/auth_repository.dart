import 'package:clean_architecture_blogs/core/error/failure.dart';
import 'package:clean_architecture_blogs/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailandPassword({
    required String email,
    required String password,
  });
}
