import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/home/presentation/screens/home_screen.dart';

class BottomNavHolderScreen extends StatefulWidget {
  const BottomNavHolderScreen({super.key});

  static const String name = '/bottom-nav-holder';

  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {

 final List<Widget> _screens = [
   HomeScreen(),
   HomeScreen(),
   HomeScreen(),
   HomeScreen(),
 ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: mainNavController.currentIndex,
            onDestinationSelected: mainNavController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_checkout),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
