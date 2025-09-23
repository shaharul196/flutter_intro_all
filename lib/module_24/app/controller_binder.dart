import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/authentication_controller.dart';
import 'package:ostad_flutter_sazu/module_24/app/set_up_network_client.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/verify_otp_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
  }

}