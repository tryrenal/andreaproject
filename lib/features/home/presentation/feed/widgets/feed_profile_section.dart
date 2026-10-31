import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class FeedProfileSection extends StatelessWidget {
  final String image;
  final String name;

  const FeedProfileSection({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(backgroundImage: AssetImage(image)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(color: AppPallete.whiteColor),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppPallete.whiteColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppPallete.blackColor,
          ),
          child: Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
