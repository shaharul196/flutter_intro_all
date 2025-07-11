import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/pin_varification_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/screen_background.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  static const String name = '/forgot-password-email';


  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A 6 digits OTP will be sent to your email address',
                    style: Theme.of(context).textTheme.titleSmall ?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value){
                      String email = value ?? '';
                      if (EmailValidator.validate(email) == false){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Icon(Icons.arrow_circle_right_outlined, size: 20),
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

  void _onTapSubmitButton() {
    // if(_formKey.currentState!.validate()){
    //   // TODO: Sign in with Api
    // }
    Navigator.pushReplacementNamed(context, PinVerificationScreen.name);
  }


  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }

}


