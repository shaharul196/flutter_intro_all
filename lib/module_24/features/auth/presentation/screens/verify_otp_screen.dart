import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/authentication_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/verify_otp_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/widgets/app_logo.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/screens/bottom_nav_holder_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  static const String name = '/verify-otp';

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpController _verifyOtpController =
      Get.find<VerifyOtpController>();

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
                Text('Enter OTP Code', style: textTheme.titleLarge),
                Text(
                  'A 6 digits OTP has been sent to your email address',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),

                PinCodeTextField(
                  controller: _otpController,
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(shape: PinCodeFieldShape.box),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  appContext: context,
                ),

                SizedBox(height: 16),

                GetBuilder<VerifyOtpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.verifyOtpInProgress == false,
                      replacement: CenteredCircularProgress(),
                      child: FilledButton(
                        onPressed: () {
                          _onTapVerifyButton();
                        },
                        child: Text('Verify'),
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

  void _onTapVerifyButton() {
    // TODO Form validate check
    _verifyOtp();
  }

  Future<void> _verifyOtp() async {
    VerifyOtpRequestModel model = VerifyOtpRequestModel(
      email: widget.email,
      otp: _otpController.text,
    );

    final bool isSuccess = await _verifyOtpController.verifyOtp(model);
    if (isSuccess) {
      await Get.find<AuthenticationController>().saveUserData(
        _verifyOtpController.userModel!,
        _verifyOtpController.accessToken!,
      );
      Navigator.pushNamedAndRemoveUntil(context, BottomNavHolderScreen.name, (predicate) => false);
    } else {
      shownSnackBarMessage(context, _verifyOtpController.errorMessage!);
    }
  }

  void _onTapBackToLoginButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (predicate) => false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }
}
