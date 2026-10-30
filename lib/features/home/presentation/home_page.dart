import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:andreaproject/features/home/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomePage());

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _handleNavigation(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 24),
        child: Center(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
            padding: EdgeInsets.all(6),
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
                  isSelected: _selectedIndex == 0,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 1,
                  icon: Icons.message_outlined,
                  label: "Message",
                  isSelected: _selectedIndex == 1,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 2,
                  icon: Icons.shop_2_outlined,
                  label: "Shop",
                  isSelected: _selectedIndex == 2,
                  onSelected: _handleNavigation,
                ),
                BottomNavItem(
                  index: 3,
                  icon: Icons.person_outline,
                  label: "Profile",
                  isSelected: _selectedIndex == 3,
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
