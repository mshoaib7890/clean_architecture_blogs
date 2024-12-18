import 'package:clean_architecture_blogs/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/wigdets/auth_fields.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/wigdets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Signup Successful! User ID: ${state.userId}")),
            );
            // Navigate to another page
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Sign Up.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                AuthField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                AuthField(
                  hintText: 'password',
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AuthGradientButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); // Close keyboard and remove focus
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                      print('Name: ${nameController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
