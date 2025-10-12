import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String? _errorMessage;

  bool get addToCartInProgress => _addToCartInProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> getAddToCard(String productId) async {
    bool isSuccess = false;
    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.addToCartUrl, body: {'product': productId});
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage;
    }

    _addToCartInProgress = false;
    update();

    return isSuccess;
  }
}
