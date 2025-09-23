import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/data/models/sign_in_request_model.dart';
import '../../../shared/data/models/user_model.dart';

class SignInController extends GetxController {
  bool _signInProgress = false;
  String? _errorMessage;
  UserModel? _userModel;
  String? _accessToken;

  String? get errorMessage => _errorMessage;

  bool get signInProgress => _signInProgress;

  UserModel? get userModel => _userModel;

  String? get accessToken => _accessToken;

  Future<bool> signIn(SignInRequestModel model) async {
    bool isSuccess = false;
    _signInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.loginUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.errorMassage;
    }

    _signInProgress = false;
    update();

    return isSuccess;
  }
}
