import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/models/user_model.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/urls.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/auth_controller.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, String> requestBody = {"email": email, "password": password};

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urlss.loginUrl,
      body: requestBody,
      isFromLogin: true,
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
    } else {
      _errorMessage = response.errorMassage!;
    }
    return isSuccess;
  }
}
