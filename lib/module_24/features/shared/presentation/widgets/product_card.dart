import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/app/assets_paths.dart';
import 'package:ostad_flutter_sazu/module_24/app/utils/constants.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        elevation: 2,
        shadowColor: AppColors.themeColor.withOpacity(0.2),
        color: Colors.white,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Image.asset(
                  AssetsPaths.dummyImagePng,
                  height: 80,
                  width: 140,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Nike Air jordan A45GH',
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${takaSign}120',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Text('4.2'),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}