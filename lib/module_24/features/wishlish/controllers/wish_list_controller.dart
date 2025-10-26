import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/core/models/network_response.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/wishlish/data/models/wishlist_model.dart';
import '../../../app/urls.dart';

class WishListController extends GetxController {
  bool _wishListInProgress = false;
  String? _errorMessage;
  List<WishListModel> _wishList = [];

  // WishListModel? _wishListModel;

  bool get wishListInProgress => _wishListInProgress;

  String? get errorMessage => _errorMessage;

  List<WishListModel> get wishList => _wishList;

  // WishListModel? get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _wishListInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.wishListUrl,
    );

    if (response.isSuccess) {
      // _wishListModel = WishListModel.fromJson(response.body!['data']['results']);
      List<WishListModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(WishListModel.fromJson(jsonData));
      }

      // _wishList.addAll(list);
      _wishList = list;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }

    _wishListInProgress = false;
    update();
    return isSuccess;
  }
}
