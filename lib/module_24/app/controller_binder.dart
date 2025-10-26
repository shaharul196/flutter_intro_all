import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/authentication_controller.dart';
import 'package:ostad_flutter_sazu/module_24/app/set_up_network_client.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/controller/verify_otp_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/carts/presentation/controllers/cart_list_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/presentation/controller/home_slider_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/controllers/product_list_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/controllers/add_review_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/category_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/wishlish/controllers/wish_list_controller.dart';
import '../features/auth/presentation/controller/sign_in_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(SignInController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(CartListController());
    Get.put(WishListController());
    Get.put(ProductListController());
    Get.put(AddReviewController());

  }

}