import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_16/data/models/reset_model.dart';
import 'package:ostad_flutter_sazu/module_16/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/module_16/data/urls.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/widget/snackbar_massage.dart';

class ChangePasswordController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> resetPassword(String email, String otp, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, String> requestBody = {
      "email": ResetModel.email,
      "OTP": ResetModel.otp,
      "password": password,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urlss.getResetPasswordUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      _errorMessage = null;

      // Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) =>false)}else{
    }else{
      _errorMessage = response.errorMassage!;
    }

    _inProgress =false;
    update();

    return isSuccess;
  }
}