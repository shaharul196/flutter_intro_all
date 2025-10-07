import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import '../../data/models/home_slider_model.dart';

class HomeSliderController extends GetxController {
  bool _getSlidersInProgress = false;
  String? _errorMessage;
  List<HomeSliderModel> _sliders = [];

  bool get getSlidersInProgress => _getSlidersInProgress;

  String? get errorMessage => _errorMessage;

  List<HomeSliderModel> get sliders => _sliders;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _getSlidersInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.homeSlidersUrl,
    );
    if (response.isSuccess) {
      _errorMessage = null;
      List<HomeSliderModel> listOfSliders = [];
      for (Map<String, dynamic> jsonData
          in response.body?['data']['results'] ?? []) {
        listOfSliders.add(HomeSliderModel.fromJson(jsonData));
      }
      _sliders = listOfSliders;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage;
    }
    _getSlidersInProgress = false;
    update();

    return isSuccess;
  }
}
