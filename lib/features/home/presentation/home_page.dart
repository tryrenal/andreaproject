import 'package:flutter/material.dart';
import 'package:andreaproject/core/themes/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _card(),
              const SizedBox(height: 40),
              _balance(),
              const SizedBox(height: 40),
              _menu(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EARN\nMORE'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: AppColor.black,
                                fontSize: 38,
                                letterSpacing: -1.5,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              'Get up to 3% APY\non your balance',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: -1.5,
                                height: 1.0,
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset('assets/images/cat_banner.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _menu() {
    return Row(
      children: [
        _menuItem(Icons.arrow_downward_outlined, 'Receive'),
        const SizedBox(width: 5),
        _menuItem(Icons.arrow_upward_outlined, 'Send'),
        const SizedBox(width: 5),
        _menuItem(Icons.swap_horiz_outlined, 'Swap'),
      ],
    );
  }

  Expanded _menuItem(IconData icon, String label) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: AppColor.black),
              Text(label, style: TextStyle(color: AppColor.black)),
            ],
          ),
        ),
      ),
    );
  }

  Stack _card() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: -0.10,
          child: Transform.translate(
            offset: const Offset(10, -10),
            child: Image.asset('assets/images/visa_bg.png'),
          ),
        ),
        Transform.rotate(
          angle: 0.20,
          child: Transform.translate(
            offset: const Offset(-10, 10),
            child: Image.asset('assets/images/visa_bg.png'),
          ),
        ),
        Image.asset('assets/images/visa.png'),
      ],
    );
  }

  Row _balance() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'TOTAL BALANCE',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.visibility_outlined,
                    color: AppColor.black.withValues(alpha: 0.7),
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 4),

              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '\$12,420',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColor.black,
                        fontSize: 38,
                        letterSpacing: -1.5,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: '.20',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Total earned rewards: \$100',
                style: TextStyle(
                  color: AppColor.black.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        const CustomSticker(),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColor.purple,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/renal_ava.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                color: AppColor.black,
              ),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                height: 14,
                width: 14,
                decoration: const BoxDecoration(
                  color: AppColor.purple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.menu_rounded, color: AppColor.black),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

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
