import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/add_review.screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/color_picker.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/product_image_slider.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/size_picker.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/total_price_and_cart_section.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nike A123 - New Edition of Jordan Sports',
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
                                            '4.2',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, AddReviewScreen.name);
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
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
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
                        Text('Color', style: TextStyle(fontSize: 18)),
                        ColorPicker(
                          colors: ['Red', 'White', 'Black'],
                          onSelected: (String color) {},
                        ),
                        SizedBox(height: 8),
                        Text('Size', style: TextStyle(fontSize: 18)),
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onSelected: (String size) {},
                        ),
                        SizedBox(height: 8),
                        Text('Description', style: TextStyle(fontSize: 18)),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
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
          TotalPriceAndCartSection(),
        ],
      ),
    );
  }
}
