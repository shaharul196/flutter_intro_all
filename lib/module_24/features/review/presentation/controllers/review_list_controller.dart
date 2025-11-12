import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import '../../../../app/urls.dart';
import '../data/models/review_model.dart';

class ReviewListController extends GetxController {
  bool _getReviewInProgress = false;
  String? _errorMessage;
  List<ReviewModel> _reviewList = [];

  bool get getReviewInProgress => _getReviewInProgress;

  String? get errorMessage => _errorMessage;

  List<ReviewModel> get reviewList => _reviewList;

  Future<bool> getReviewList(String productId) async {
    bool isSuccess = false;
    _getReviewInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.reviewListUrl(productId),
    );
    if (response.isSuccess) {
      List<ReviewModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(ReviewModel.fromJson(jsonData));
      }
      _reviewList = list;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage;
    }

    _getReviewInProgress = false;
    update();
    return isSuccess;
  }
}
