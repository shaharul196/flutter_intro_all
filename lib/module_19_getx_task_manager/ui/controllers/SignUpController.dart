import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/urls.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;


  Future<bool> signUp(String email, String firstName, String lastName,
      String mobile, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();


    Map<String, String> requestBody = {
      "email": email.trim(),
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "mobile": mobile.trim(),
      "password": password,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urlss.registationUrl, body: requestBody,
    );

    _inProgress = false;
    update();

    if (response.isSuccess) {
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }
    return isSuccess;
  }
}
