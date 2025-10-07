import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_flutter_sazu/module_24/app/assets_paths.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/presentation/controller/home_slider_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/widgets/app_bar_icon_button.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/widgets/home_banner_slider.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/category_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/product_card.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/product_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetsPaths.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {}, iconData: Icons.person),
          AppBarIconButton(onTap: () {}, iconData: Icons.call),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.notifications_on_outlined,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              _buildSearchBar(),
              SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                builder: (controller) {
                  if (controller.getSlidersInProgress) {
                    return SizedBox(
                      height: 180,
                      child: CenteredCircularProgress(),
                    );
                  }
                  return HomeBannerSlider(sliders: controller.sliders);
                },
              ),
              SizedBox(height: 16),
              _buildSectionHeader(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainNavController>().moveToCategory();
                },
              ),
              _buildCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _buildNewProductList(),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildSpecialProductList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          if (controller.initialLoading) {
            return CenteredCircularProgress();
          }
          return ListView.separated(
            itemCount:
                controller.categoryList.length > 10
                    ? 10
                    : controller.categoryList.length,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCategoryItem(
                categoryModel: controller.categoryList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
          );
        },
      ),
    );
  }

  //TODO ata listView builder/separated diye korte parbo
  Widget _buildNewProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _buildSpecialProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade100,
        filled: true,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
