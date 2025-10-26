import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/data/models/product_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/product_card.dart';
import '../../controllers/wish_list_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.find<WishListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _wishListController.getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: GetBuilder(
        init: _wishListController,
        builder: (controller) {
          if (controller.wishListInProgress) {
            return CenteredCircularProgress();
          }
          if (controller.wishList.isEmpty) {
            return Center(child: Text('No items in wishLists'));
          }
          return GridView.builder(
            itemCount: controller.wishList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final wishItem = controller.wishList[index];
              final product = ProductModel(
                id: wishItem.id,
                title: wishItem.title,
                photos: wishItem.photos,
                currentPrice: wishItem.currentPrice,
                rating: wishItem.rating,
              );
              return FittedBox(child: ProductCard(productModel: product));
            },
          );
        },
      ),
    );
  }
}
