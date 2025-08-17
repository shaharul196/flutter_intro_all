import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/screen_background.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/snackbar_massage.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/SignUpController.dart';
import '../widget/centered_circular_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();


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
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
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
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your mobile number';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  GetBuilder<SignUpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapSignUpButton,
                          child: Icon(Icons.arrow_circle_right_outlined, size: 20),
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 32),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: " Have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
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

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    bool isSuccess = await _signUpController.signUp(
        _emailTEController.text.trim(),
        _firstNameTEController.text.trim(),
        _lastNameTEController.text.trim(),
        _phoneNumberTEController.text.trim(),
        _passwordTEController.text,
    );

    if(isSuccess) {
      _clearTextFields();
      if (mounted) {
        showSnackBarMassage(
            context, 'Registration has been success.Please login');
      }
    }else{
      if(mounted){
        showSnackBarMassage(context, _signUpController.errorMessage!);
      }
    }
  }

  // Future<void> _SignUp() async {
  //   _signUpInProgress = true;
  //   setState(() {});
  //   Map<String, String> requestBody = {
  //       "email": _emailTEController.text.trim(),
  //       "firstName":_firstNameTEController.text.trim(),
  //       "lastName":_lastNameTEController.text.trim(),
  //       "mobile":_phoneNumberTEController.text.trim(),
  //       "password":_passwordTEController.text,
  //   };
  //   NetworkResponse response = await NetworkCaller.postRequest(
  //     url: Urlss.registationUrl, body: requestBody,
  //   );
  //
  //   _signUpInProgress = false;
  //   setState(() {});
  //   if(response.isSuccess){
  //     _clearTextFields();
  //     showSnackBarMassage(context, 'Registation has been success.Please login');
  //   }else{
  //     showSnackBarMassage(context, response.errorMassage!);
  //   }
  // }

  void _clearTextFields(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _phoneNumberTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignInButton() {
    Get.offNamed(SignInScreen.name);
    // Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneNumberTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
