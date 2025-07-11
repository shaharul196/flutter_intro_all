import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/forgot_password_email_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/screen_background.dart';
import 'package:email_validator/email_validator.dart';

import 'main_navigation_bar_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    // autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(hintText: 'Email'),
                    // validator: (String? value){
                    //   if(value?.isEmpty ?? true){
                    //     return 'Enter a valid email';
                    //   }
                    //   return null;
                    // },

                    // emailvalidator package use korar condition
                    validator: (String? value) {
                      String email = value ?? '';
                      if (EmailValidator.validate(email) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: obscureText,

                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Password',

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),

                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapSignInButton,
                    child: Icon(Icons.arrow_circle_right_outlined, size: 20),
                  ),
                  SizedBox(height: 32),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        RichText(
                          text: TextSpan(
                            text: "Don't have a account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = _onTapSignUpButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      // TODO: Sign in with Api
    }
    Navigator.pushNamedAndRemoveUntil(context, MainNavigationBarScreen.name, (predicate) => false);
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushReplacementNamed(context, ForgotPasswordEmailScreen.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }


  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
