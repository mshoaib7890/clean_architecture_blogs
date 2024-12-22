import 'package:clean_architecture_blogs/core/common/widgets/loader.dart';
import 'package:clean_architecture_blogs/core/themes/app_pallate.dart';
import 'package:clean_architecture_blogs/core/utils/show_snakbar.dart';
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnakBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
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
                    obscureText: true,
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
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: const [
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
