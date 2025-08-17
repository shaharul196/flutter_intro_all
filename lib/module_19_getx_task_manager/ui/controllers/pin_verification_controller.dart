import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_16/data/models/reset_model.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/urls.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/service/network_caller.dart';

class PinVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    // if(mounted) setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getVerifyOTPUrl(email,otp),
    );

    if (response.isSuccess) {
      final String data = response.body!["data"];
      ResetModel.email = email;
      ResetModel.otp = otp;
      // ResetModel.otp = _otpTEController.text;
      // _otpTEController.clear();
      _errorMessage = null;
    } else {
      // _otpTEController.clear();
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
     update();

     return isSuccess;
  }
}