import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../core/models/network_response.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/data/models/product_model.dart';

class NewProductListController extends GetxController {
  int _currentPage = 0;
  int? _lastPageNo;
  final int _pageSize = 40;

  bool _getNewProductListInProgress = false;
  bool _isInitialLoading = false;
    List<ProductModel> _newProductList = [];
  String? _errorMessage;

  bool get getNewProductListInProgress => _getNewProductListInProgress;
  bool get isInitialLoading => _isInitialLoading;
  List<ProductModel> get newProductList => _newProductList;
  String? get errorMessage => _errorMessage;

  Future<bool> getNewProductList() async {
    bool isSuccess = false;

    if (_currentPage > (_lastPageNo ?? 1)) {
      // TODO return korbe mane kicui hobe na
      return false;
    }
    if (_currentPage == 0) {
      _newProductList.clear();
      _isInitialLoading = true;
    } else {
      _getNewProductListInProgress = true;
    }
    update();
    _currentPage++;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.newProductUrl(_currentPage, _pageSize,),
    );
    if (response.isSuccess) {
      _lastPageNo = response.body!['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(ProductModel.fromJson(jsonData));
      }
      // _newProductList = list;
      _newProductList.addAll(list);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage;
    }

    if (_isInitialLoading) {
      _isInitialLoading = false;
    } else {
      _getNewProductListInProgress = false;
    }
    update();
    return isSuccess;
  }
}