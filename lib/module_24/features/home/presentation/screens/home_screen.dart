import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_flutter_sazu/module_24/app/assets_paths.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/widgets/app_bar_icon_button.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/widgets/home_banner_slider.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';
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
              HomeBannerSlider(),
              SizedBox(height: 16),
              _buildSectionHeader(title: 'All Categories', onTapSeeAll: () {
                Get.find<MainNavController>().moveToCategory();
              }),
               _buildCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
               height: 100,
               child: ListView.separated(
                 itemCount: 10,
                 primary: false,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index) {
                   return ProductCategoryItem();
                 },
                 separatorBuilder: (context,index) {
                   return SizedBox(width: 10,);
                 }
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


