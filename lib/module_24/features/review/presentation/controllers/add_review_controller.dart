import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/data/models/add_review_model.dart';
import '../../../../app/urls.dart';

class AddReviewController extends GetxController {
  bool _addReviewInProgress = false;
  String? _errorMessage;

  bool get addReviewInProgress => _addReviewInProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> getAddReview(AddReviewModel model) async {
    bool isSuccess = false;
    _addReviewInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.addReviewUrl, body: model.toJson());

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.body!['msg'] ?? response.errorMassage;
    }

    _addReviewInProgress = false;
    update();
    return isSuccess;
  }
}
