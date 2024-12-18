import 'package:clean_architecture_blogs/core/secrets/supabase_secrets.dart';
import 'package:clean_architecture_blogs/features/auth/data/datasource/auth_supabase_data.dart';
import 'package:clean_architecture_blogs/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture_blogs/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_blogs/features/auth/domain/usecases/signup_usecase.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLoader = GetIt.instance;

Future<void> initDependencies() async {
  // Step 1: Initialize Supabase client first
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLoader.registerLazySingleton<SupabaseClient>(() => supabase.client);

  // Step 2: Initialize auth dependencies
  _initAuth();
}

void _initAuth() {
  // Step 3: Register Data Sources
  serviceLoader.registerFactory<AuthSupabaseData>(
    () => AuthSupabaseDataImpl(serviceLoader<SupabaseClient>()),
  );

  // Step 4: Register Repository
  serviceLoader.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLoader<AuthSupabaseData>()),
  );

  // Step 5: Register UseCase
  serviceLoader.registerFactory<SignUp>(
    () => SignUp(serviceLoader<AuthRepository>()),
  );

  // Step 6: Register BLoC
  serviceLoader.registerLazySingleton<AuthBloc>(
    () => AuthBloc(signUpUseCase: serviceLoader<SignUp>()),
  );
}
