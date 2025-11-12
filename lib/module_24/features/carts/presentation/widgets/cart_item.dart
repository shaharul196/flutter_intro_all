import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/carts/presentation/controllers/cart_list_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/utils/constants.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';
import '../../data/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      shadowColor: AppColors.themeColor.withOpacity(0.3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(),
            child: Image.network(
              cartItemModel.product.photos.isEmpty
                  ? ''
                  : cartItemModel.product.photos.first,
              height: 80,
              width: 80,
              errorBuilder:
                  (_, __, ___) => Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    child: Icon(Icons.error_outline),
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.product.title,
                              style: TextTheme.of(context).titleSmall,
                            ),
                            Text(
                              'Size: ${cartItemModel.size ?? 'Nil'}  Color:${cartItemModel.color ?? 'Nil'}',
                              style: TextTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // print('Deleting Cart ID: ${cartItemModel.id}');
                          // print('Product ID: ${cartItemModel.product.id}');
                          // Get.find<CartListController>().deleteCartItem(cartItemModel.id);
                          // print('item deleted ....${cartItemModel.id}');

                          _deleteCartItem(context);
                        },
                        icon: Icon(Icons.delete_forever_outlined),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$takaSign ${cartItemModel.product.currentPrice}',
                        style: TextTheme.of(
                          context,
                        ).titleSmall?.copyWith(color: AppColors.themeColor),
                      ),

                      IncrementDecrementButton(
                        onChange: (int value) {
                          Get.find<CartListController>().updateCart(
                            cartItemModel.id,
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCartItem(BuildContext context) async {
    final CartListController cartListController =
        Get.find<CartListController>();

    // Show confirmation dialog
    bool? itemDelete = await showDialog<bool>(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('Remove Item'),
            content: const Text(
              'Are you sure you want to remove this item from your cart?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('Remove'),
              ),
            ],
          ),
    );

    if (itemDelete == true && context.mounted) {
      bool isSuccess = await cartListController.deleteCartItem(
        cartItemModel.id,
      );

      if (context.mounted) {
        if (isSuccess) {
          shownSnackBarMessage(context, 'Item removed from cart');
        } else {
          shownSnackBarMessage(
            context,
            cartListController.errorMessage ?? 'Failed to remove item',
          );
        }
      }
    }
  }
}
