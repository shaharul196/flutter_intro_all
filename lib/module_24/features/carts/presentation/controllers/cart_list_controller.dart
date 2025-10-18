import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/urls.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/carts/data/cart_item_model.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  List<CartItemModel> _cartItemList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<CartItemModel> get cartItemList => _cartItemList;

  String? get errorMessage => _errorMessage;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.cartListUrl,
    );

    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(CartItemModel.fromJson(jsonData));
      }
      _cartItemList = list;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  int get totalPrice {
    int total = 0;
    for (CartItemModel item in _cartItemList) {
      total += (item.quantity * item.product.currentPrice);
    }
    return total;
  }

  void updateCart(String cartItemId, int quantity) {
    _cartItemList.firstWhere((item) => item.id == cartItemId).quantity =
        quantity;
    update();
  }
}
