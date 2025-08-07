import 'package:get/get.dart';
import '../../../module_16/data/models/user_model.dart';
import '../../../module_16/data/service/network_caller.dart';
import '../../../module_16/data/urls.dart';
import '../../../module_16/ui/controllers/auth_controller.dart';

class SignInController extends GetxController{
  // TODO getx controller objective ai page ta signIn kotre parlo ki parlo na
  bool _inProgress = false;
  String? _errorMessage;

  // TODO Baire theke jeno kew change korte na pare
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, String> requestBody = {
      "email": email,
      "password": password,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urlss.loginUrl,
      body: requestBody, isFromLogin: true,
    );

    _inProgress = false;
    update();

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.body!['data']);
      String token = response.body!['token'];

      await AuthController.saveUserData(userModel, token);
      isSuccess = true;
      // TODO isSuccess hole errorMassage clear hobe
      _errorMessage = null;
    }else {
      _errorMessage = response.errorMassage!;
    }
    return isSuccess;
  }
}