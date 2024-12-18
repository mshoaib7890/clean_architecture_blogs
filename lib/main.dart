import 'package:clean_architecture_blogs/core/themes/themes.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/pages/login.dart';
import 'package:clean_architecture_blogs/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLoader<AuthBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const Login(),
    );
  }
}
