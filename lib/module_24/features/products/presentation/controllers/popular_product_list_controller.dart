import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../core/models/network_response.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/data/models/product_model.dart';

class PopularProductListController extends GetxController {
  int _currentPage = 0;
  int? _lastPageNo;
  final int _pageSize = 10;

  bool _getPopularProductListInProgress = false;
  bool _isInitialLoading = false;
   final List<ProductModel> _popularProductList = [];
  String? _errorMessage;

  bool get getPopularProductListInProgress => _getPopularProductListInProgress;
  bool get isInitialLoading => _isInitialLoading;
  List<ProductModel> get popularProductList => _popularProductList;
  String? get errorMessage => _errorMessage;

  Future<bool> getPopularProductList() async {
    bool isSuccess = false;

    if (_currentPage > (_lastPageNo ?? 1)) {
      // TODO return korbe mane kicui hobe na
      return false;
    }
    if (_currentPage == 0) {
      _popularProductList.clear();
      _isInitialLoading = true;
    } else {
      _getPopularProductListInProgress = true;
    }
    update();
    _currentPage++;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.popularProductUrl(_currentPage, _pageSize,),
    );
    if (response.isSuccess) {
      _lastPageNo = response.body!['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(ProductModel.fromJson(jsonData));
      }
      // _popularProductList = list;
      _popularProductList.addAll(list);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage;
    }

    if (_isInitialLoading) {
      _isInitialLoading = false;
    } else {
      _getPopularProductListInProgress = false;
    }
    update();
    return isSuccess;
  }
}