import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import '../../data/models/sign_up_request_model.dart';

class SignUpController extends GetxController {
  bool _signUpInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get signUpInProgress => _signUpInProgress;

  Future<bool> signUp(SignUpRequestModel model) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.signUpUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.errorMassage;
    }

    _signUpInProgress = false;
    update();

    return isSuccess;
  }
}
