import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/widgets/app_logo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

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
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(shape: PinCodeFieldShape.box),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  appContext: context,
                ),

                SizedBox(height: 16),

                FilledButton(
                  onPressed: () {
                    _onTapVerifyButton();
                  },
                  child: Text('Verify'),
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

  void _onTapVerifyButton() {}

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
