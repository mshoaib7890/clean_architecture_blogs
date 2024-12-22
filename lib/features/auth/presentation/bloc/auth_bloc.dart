import 'package:clean_architecture_blogs/features/auth/domain/entity/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_blogs/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp signUpUseCase;

  AuthBloc({required this.signUpUseCase}) : super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());

      try {
        final result = await signUpUseCase(
          SignUpUsecaseParams(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );

        result.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (user) => emit(AuthSuccess(user)),
        );
      } catch (e) {
        emit(AuthFailure("Unexpected error: $e"));
      }
    });
  }
}
