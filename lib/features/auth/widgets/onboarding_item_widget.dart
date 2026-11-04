import 'package:andreaproject/core/themes/app_color.dart';
import 'package:andreaproject/features/auth/presentation/models/onboarding_item_model.dart';
import 'package:flutter/material.dart';

class ItemOnboardingWidget extends StatelessWidget {
  const ItemOnboardingWidget({
    super.key,
    required this.item,
    required this.isOdd,
  });

  final OnboardingItemModel item;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: isOdd ? NormalCardClipper() : SkewedCardClipper(),
            child: Container(
              decoration: BoxDecoration(color: item.backgroundColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(item.icon, color: AppColor.white, size: 24),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          item.description,
                          style: const TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: -20,
            bottom: -50,
            top: -50,
            child: SizedBox(
              height: 110,
              width: 130,
              child: Transform.rotate(
                angle: isOdd ? 0.45 : -0.50,
                child: Image.asset(item.imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NormalCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 24.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SkewedCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double slant = 15.0;
    final double radius = 24.0;

    final double leftTopSpace = 4.0;

    path.moveTo(radius, leftTopSpace);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);

    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );

    path.lineTo(radius, size.height - slant);
    path.quadraticBezierTo(
      0,
      size.height - slant,
      0,
      size.height - slant - radius,
    );
    path.lineTo(0, leftTopSpace + radius);
    path.quadraticBezierTo(0, leftTopSpace, radius, leftTopSpace);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
