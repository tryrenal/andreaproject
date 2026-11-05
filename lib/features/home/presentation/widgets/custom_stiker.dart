import 'package:andreaproject/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomSticker extends StatelessWidget {
  const CustomSticker({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.1,
      child: ClipPath(
        clipper: RoughStickerClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          color: AppColor.black,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'SMALL\nSTEPS\nBIG\nFREEDOM',
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  height: 1.0,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(
                    angle: 0.2,
                    child: const Icon(
                      Icons.flash_on,
                      color: AppColor.greenLight,
                      size: 24,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(6, -8),
                    child: Transform.rotate(
                      angle: 0.2,
                      child: const Icon(
                        Icons.flash_on,
                        color: AppColor.greenLight,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoughStickerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(4, 2);

    path.cubicTo(w * 0.2, -2, w * 0.4, 5, w * 0.7, 1);
    path.cubicTo(w * 0.85, -1, w * 0.9, 4, w - 2, 3);

    path.cubicTo(w + 2, h * 0.2, w - 4, h * 0.5, w + 1, h * 0.8);
    path.cubicTo(w + 3, h * 0.9, w - 2, h - 4, w - 3, h - 1);

    path.cubicTo(w * 0.8, h + 2, w * 0.6, h - 4, w * 0.3, h + 1);
    path.cubicTo(w * 0.1, h + 3, 2, h - 2, 1, h - 4);

    path.cubicTo(-2, h * 0.7, 3, h * 0.4, -1, h * 0.1);
    path.cubicTo(-2, 0, 2, 4, 4, 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
