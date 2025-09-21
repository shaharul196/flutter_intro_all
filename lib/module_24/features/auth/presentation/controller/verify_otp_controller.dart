import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/data/models/verify_otp_request_model.dart';

class VerifyOtpController extends GetxController {
  bool _verifyOtpInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get verifyOtpInProgress => _verifyOtpInProgress;

  Future<bool> verifyOtp(VerifyOtpRequestModel model) async {
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.verifyOtpUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.errorMassage;
    }

    _verifyOtpInProgress = false;
    update();

    return isSuccess;
  }
}
