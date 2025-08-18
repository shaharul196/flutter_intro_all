import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/models/reset_model.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/urls.dart';

class ForgotPasswordController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> getRecoverVerifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getRecoverVerifyEmailUrl(email),
    );

    if (response.isSuccess) {
      final String data = response.body!["data"];
      // ResetModel.email = _emailTEController.text;
      ResetModel.email = email;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
