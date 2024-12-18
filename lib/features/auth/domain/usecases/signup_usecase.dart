import 'package:clean_architecture_blogs/core/error/failure.dart';
import 'package:clean_architecture_blogs/core/usecase/usecase.dart';
import 'package:clean_architecture_blogs/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUp implements UseCase<String, SignUpUsecaseParams> {
  final AuthRepository authRepository;

  SignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(SignUpUsecaseParams params) async {
    return await authRepository.signUpWithEmailandPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpUsecaseParams {
  final String name;
  final String email;
  final String password;

  SignUpUsecaseParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
