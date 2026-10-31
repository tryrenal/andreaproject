import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class FeedSearchSection extends StatelessWidget {
  const FeedSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppPallete.blackColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Icon(Icons.search_rounded, color: AppPallete.whiteColor, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: TextStyle(color: AppPallete.whiteColor, fontSize: 15),
              decoration: InputDecoration(
                hint: Text("Search Coffee, bakery..."),
                hintStyle: TextStyle(
                  color: AppPallete.greyColor,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppPallete.greenColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: AppPallete.blackColor,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'AI Mode',
                    style: TextStyle(
                      color: AppPallete.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
