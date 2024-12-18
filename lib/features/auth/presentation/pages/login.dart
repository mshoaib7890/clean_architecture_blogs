import 'package:clean_architecture_blogs/core/themes/app_pallate.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/pages/sign_up.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/wigdets/auth_fields.dart';
import 'package:clean_architecture_blogs/features/auth/presentation/wigdets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Login());
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final fromkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15.0,
              ),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AuthField(
                hintText: "Password",
                controller: pwdController,
                obscureText: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              AuthGradientButton(
                buttonText: "Sign In",
                onPressed: () {},
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
        ),
      ),
    );
  }
}
