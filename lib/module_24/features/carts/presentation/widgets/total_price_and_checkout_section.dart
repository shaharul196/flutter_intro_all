import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/app/utils/constants.dart';
import 'package:ostad_flutter_sazu/module_24/features/carts/presentation/controllers/cart_list_controller.dart';

class TotalPriceAndCheckoutSection extends StatelessWidget {
  const TotalPriceAndCheckoutSection({super.key});

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
                'Total Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GetBuilder<CartListController>(
                builder: (controller) {
                  return Text(
                    '$takaSign${controller.totalPrice}',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.themeColor,
                    ),
                  );
                }
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text('Checkout')),
          ),
        ],
      ),
    );
  }
}
