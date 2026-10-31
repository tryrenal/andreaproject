import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:andreaproject/features/home/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  void _handleNavigation(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Center(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppPallete.blackColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomNavItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  label: "Home",
                  isSelected: navigationShell.currentIndex == 0,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 1,
                  icon: Icons.message_outlined,
                  label: "Message",
                  isSelected: navigationShell.currentIndex == 1,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 2,
                  icon: Icons.shop_2_outlined,
                  label: "Shop",
                  isSelected: navigationShell.currentIndex == 2,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 3,
                  icon: Icons.person_outline,
                  label: "Profile",
                  isSelected: navigationShell.currentIndex == 3,
                  onSelected: _handleNavigation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
