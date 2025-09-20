import 'package:flutter/cupertino.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/app/app.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';

NetworkCaller setUpNetworkClient() {
  return NetworkCaller(onUnAuthorize: _onUnAuthorize, accessToken: '');
}

Future<void> _onUnAuthorize() async {
  // TODO Redirect to login and remove cache
  Navigator.pushNamedAndRemoveUntil(
    CraftyBay.navigatorKey.currentContext!,
    SignInScreen.name,
    (predicate) => false,
  );
}
