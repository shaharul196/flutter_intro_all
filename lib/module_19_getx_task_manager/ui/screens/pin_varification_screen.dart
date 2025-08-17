import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/data/models/reset_model.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/screen_background.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/snackbar_massage.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/pin_verification_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'change_password.dart';
import 'package:get/get.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key, required this.email, });
  final String email;

  static const String name = '/pin-verification';


  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PinVerificationController _pinVerificationController = Get.find<PinVerificationController>();

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
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A 6 digits OTP has been sent to your email address',
                    style: Theme.of(context).textTheme.titleSmall ?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 24),

                  PinCodeTextField(
                    length: 6,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedColor: Colors.green,
                      inactiveColor: Colors.grey,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    controller: _otpTEController,
                    appContext: context,
                  ),


                  SizedBox(height: 16),
                  GetBuilder<PinVerificationController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapSubmitButton,
                          child: Text('Verity'),
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

  void _onTapSubmitButton() {
    if(_formKey.currentState!.validate()){
      _getPinVerification();
    }
    // Navigator.pushNamed(context, ChangePasswordScreen.name);
  }

  Future<void> _getPinVerification() async {
    final bool isSuccess = await _pinVerificationController.verifyOTP(
        widget.email, _otpTEController.text);
    if(isSuccess){
      Get.offAllNamed(ChangePasswordScreen.name);
    }else {
      if (mounted) {
        showSnackBarMassage(context, _pinVerificationController.errorMessage!);
      }
    }
  }


  void _onTapSignInButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }

}


