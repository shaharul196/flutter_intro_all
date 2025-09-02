import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 50),
                AppLogo(width: 100),
                SizedBox(height: 24),
                Text('Welcome Back', style: textTheme.titleLarge),
                Text(
                  'Please enter your email and password',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 16),

                FilledButton(
                  onPressed: () {
                    _onTapLoginButton();
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 16,),
                TextButton(onPressed: (){
                  _onTapSignUpButton();
                }, child: Text('Sign up')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {}

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
