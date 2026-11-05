import 'package:andreaproject/features/home/presentation/widgets/animated_counter.dart';
import 'package:andreaproject/features/home/presentation/widgets/custom_stiker.dart';
import 'package:flutter/material.dart';
import 'package:andreaproject/core/themes/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _stickerController;
  late final AnimationController _bannerTextController;
  late final AnimationController _bannerFlipController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _stickerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _bannerTextController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..forward();

    _bannerFlipController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    )..forward();

    Future.delayed(Duration(milliseconds: 3000), () {
      if (mounted) _stickerController.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _stickerController.dispose();
    _bannerFlipController.dispose();
    _bannerTextController.dispose();
    super.dispose();
  }

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
              _banner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    final textFade = CurvedAnimation(
      parent: _bannerTextController,
      curve: Curves.easeOut,
    );

    final flip = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: -1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),

      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 20),

      TweenSequenceItem(
        tween: Tween(
          begin: -1.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_bannerFlipController);

    return Container(
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
              child: FadeTransition(
                opacity: textFade,
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
          ),
          Expanded(
            flex: 1,
            child: AnimatedBuilder(
              animation: flip,
              builder: (context, child) {
                return Transform.scale(scaleX: flip.value, child: child);
              },
              child: Image.asset('assets/images/cat_banner.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu() {
    final receiveItem = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.55, curve: Curves.easeOutCubic),
    );
    final sendItem = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.75, curve: Curves.easeOutCubic),
    );
    final swapItem = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.95, curve: Curves.easeOutCubic),
    );

    return Row(
      children: [
        _menuItem(
          Icons.arrow_downward_outlined,
          'Receive',
          receiveItem,
          Offset(0, -1),
        ),
        const SizedBox(width: 5),
        _menuItem(Icons.arrow_upward_outlined, 'Send', sendItem, Offset(0, 1)),
        const SizedBox(width: 5),
        _menuItem(Icons.swap_horiz_outlined, 'Swap', swapItem, Offset(1, 0)),
      ],
    );
  }

  Widget _menuItem(
    IconData icon,
    String label,
    Animation<double> animation,
    Offset begin,
  ) {
    return Expanded(
      child: SlideTransition(
        position: Tween<Offset>(
          begin: begin,
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
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
        ),
      ),
    );
  }

  Widget _card() {
    final backAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
    );

    final middleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOutBack),
    );

    final frontAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOutBack),
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1.5),
            end: Offset.zero,
          ).animate(backAnimation),
          child: FadeTransition(
            opacity: backAnimation,
            child: Transform.rotate(
              angle: -0.10,
              child: Transform.translate(
                offset: const Offset(10, -10),
                child: Image.asset('assets/images/visa_bg.png'),
              ),
            ),
          ),
        ),

        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1.5),
            end: Offset.zero,
          ).animate(middleAnimation),
          child: FadeTransition(
            opacity: middleAnimation,
            child: Transform.rotate(
              angle: 0.20,
              child: Transform.translate(
                offset: const Offset(-10, 10),
                child: Image.asset('assets/images/visa_bg.png'),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1.5),
            end: Offset.zero,
          ).animate(frontAnimation),
          child: FadeTransition(
            opacity: frontAnimation,
            child: Image.asset('assets/images/visa.png'),
          ),
        ),
      ],
    );
  }

  Widget _balance() {
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

              AnimatedCounter(
                value: 12420.20,
                duration: Duration(seconds: 3),
                prefix: '\$',
                wholeStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColor.black,
                  fontSize: 38,
                  letterSpacing: -1.5,
                  height: 1.0,
                ),
                decimalStyle: TextStyle(
                  color: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Total earned rewards: ',
                    style: TextStyle(
                      color: AppColor.black.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                  AnimatedCounter(
                    value: 100,
                    duration: Duration(seconds: 3),
                    wholeStyle: TextStyle(
                      color: AppColor.black.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        _stickerAnimated(),
      ],
    );
  }

  Widget _stickerAnimated() {
    final curved = CurvedAnimation(
      parent: _stickerController,
      curve: Curves.elasticOut,
    );
    return AnimatedBuilder(
      animation: curved,
      builder: (context, child) {
        final t = curved.value;
        final opacity = (_stickerController.value * 2).clamp(0.0, 1.0);

        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: 1.0 + (1 - t) * 0.8,
            child: Transform.rotate(angle: (1 - t) * -0.35, child: child),
          ),
        );
      },
      child: CustomSticker(),
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
