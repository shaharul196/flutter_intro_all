import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/data/models/sign_up_request_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/widgets/app_logo.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpController _signUpController = Get.find<SignUpController>();

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
                SizedBox(height: 24),
                AppLogo(width: 85),
                SizedBox(height: 12),
                Text('Create new account', style: textTheme.titleLarge),
                Text(
                  'Please enter your details for new account',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _addressController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Address'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 16),

                GetBuilder<SignUpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.signUpInProgress == false,
                      replacement: CenteredCircularProgress(),
                      child: FilledButton(
                        onPressed: () {
                          _onTapSignUpButton();
                        },
                        child: Text('Sign Up'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    _onTapBackToLoginButton();
                  },
                  child: Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    // TODO validate the form
    //  if(_formKey.currentState!.validate()){
    //  }
    _signUp();

  }

  Future<void> _signUp() async {
    SignUpRequestModel model = SignUpRequestModel(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      city: _addressController.text.trim(),
      phone: _mobileController.text.trim(),
    );
    final bool isSuccess = await _signUpController.signUp(model);
    if (isSuccess) {
      shownSnackBarMessage(context, 'Sign up successful! Place login');
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else {
      shownSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }

  void _onTapBackToLoginButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
  }
}
