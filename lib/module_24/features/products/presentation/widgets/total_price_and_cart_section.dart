import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/authentication_controller.dart';
import 'package:ostad_flutter_sazu/module_24/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/controllers/add_to_cart_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';

class TotalPriceAndCartSection extends StatefulWidget {
  const TotalPriceAndCartSection({super.key, required this.productId});

  final String productId;

  @override
  State<TotalPriceAndCartSection> createState() => _TotalPriceAndCartSectionState();
}

class _TotalPriceAndCartSectionState extends State<TotalPriceAndCartSection> {
  final AddToCartController _addToCartController = AddToCartController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${takaSign}120',
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          GetBuilder(
            init: _addToCartController,
            builder: (controller) {
              return SizedBox(
                width: 120,
                child: Visibility(
                  visible: controller.addToCartInProgress == false,
                  replacement: CenteredCircularProgress(),
                  child: FilledButton(onPressed: () {
                    _onTapAddToCardButton();
                  }, child: Text('Add to Cart')),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  void _onTapAddToCardButton() async{
    if(await Get.find<AuthenticationController>().isUserAlreadyLoggedIn()){
    // TODO Add to card
      final bool isSuccess = await _addToCartController.getAddToCard(
          widget.productId);
      if(isSuccess){
        shownSnackBarMessage(context, 'Added to cart');
      }else{
        shownSnackBarMessage(context, _addToCartController.errorMessage!);
      }

    }else {
      Navigator.pushNamed(context, SignInScreen.name);
    }

  }
}
