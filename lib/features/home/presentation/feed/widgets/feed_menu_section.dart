import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class FeedMenuSection extends StatelessWidget {
  const FeedMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _MenuItem(
            icon: Icons.coffee_outlined,
            label: 'Hot Coffee',
            backgroundIconColor: AppPallete.greenColor,
          ),
          SizedBox(width: 5),
          _MenuItem(
            icon: Icons.local_drink_outlined,
            label: 'Iced Coffee',
            backgroundIconColor: AppPallete.blueColor,
          ),
          SizedBox(width: 5),
          _MenuItem(
            icon: Icons.cake_outlined,
            label: 'Passtry',
            backgroundIconColor: AppPallete.orangeColor,
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundIconColor;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.backgroundIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.blackColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundIconColor,
              ),
              child: Icon(color: AppPallete.blackColor, size: 24, icon),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                label,
                style: TextStyle(color: AppPallete.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
