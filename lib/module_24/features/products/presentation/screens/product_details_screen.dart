import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/controllers/product_details_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/color_picker.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/product_image_slider.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/size_picker.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import '../../../review/presentation/screens/add_review.screen.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsController.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.getProductDetailsInProgress) {
            return CenteredCircularProgress();
          }

          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(
                        imageUrls: controller.productDetailsModel?.photos ?? [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          // spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productDetailsModel?.title ??
                                            '',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                controller
                                                        .productDetailsModel
                                                        ?.rating ??
                                                    '',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                AddReviewScreen.name,
                                              );
                                            },
                                            child: Text(
                                              'Reviews',
                                              style: TextStyle(
                                                color: AppColors.themeColor,
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: AppColors.themeColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Icon(
                                                Icons.favorite_outline,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: IncrementDecrementButton(
                                    onChange: (int value) {},
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 8),
                            Visibility(
                              visible:
                                  (controller.productDetailsModel?.colors ?? [])
                                      .isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Color',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ColorPicker(
                              // colors: ['Red', 'White', 'Black'],
                              colors:
                                  controller.productDetailsModel?.colors ?? [],
                              onSelected: (String color) {},
                            ),
                            SizedBox(height: 16),
                            Visibility(
                              visible:
                                  (controller.productDetailsModel?.sizes ?? [])
                                      .isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'Size',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            SizePicker(
                              // sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                              sizes:
                                  controller.productDetailsModel?.sizes ?? [],
                              onSelected: (String size) {},
                            ),
                            SizedBox(height: 16),
                            Text('Description', style: TextStyle(fontSize: 18)),
                            Text(
                              controller.productDetailsModel?.description ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //TODO Expanded deoyar karone TotalPriceAndCartSection er container ke dhakka mere niche diyece
              TotalPriceAndCartSection(
                productDetailsModel: controller.productDetailsModel!,
              ),
            ],
          );
        },
      ),
    );
  }
}
