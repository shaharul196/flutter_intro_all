import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/data/models/sign_in_request_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/widgets/app_logo.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';
import '../../../../app/controllers/authentication_controller.dart';
import '../../../shared/presentation/screens/bottom_nav_holder_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController _signInController = Get.find<SignInController>();

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

                GetBuilder<SignInController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.signInProgress == false,
                      replacement: CenteredCircularProgress(),
                      child: FilledButton(
                        onPressed: () {
                          _onTapLoginButton();
                        },
                        child: Text('Login'),
                      ),
                    );
                  }
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    _onTapSignUpButton();
                  },
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    // TODO validate form
    _signIn();
  }

  Future<void> _signIn() async {
    SignInRequestModel model = SignInRequestModel(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    bool isSuccess = await _signInController.signIn(model);

    if (isSuccess) {
      await Get.find<AuthenticationController>().saveUserData(
        _signInController.userModel!,
        _signInController.accessToken!,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        BottomNavHolderScreen.name,
        (predicate) => false,
      );
    } else {
      shownSnackBarMessage(context, _signInController.errorMessage!);
    }
  }

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
