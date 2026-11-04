import 'package:andreaproject/core/themes/app_color.dart';
import 'package:andreaproject/features/auth/presentation/models/onboarding_item_model.dart';
import 'package:andreaproject/features/auth/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const int _dropMs = 1500;
  static const int _staggerMs = 500;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardingItemModel> onboardingItems = [
      OnboardingItemModel(
        title: 'Deposit',
        description: 'Add Tokens from your wallet',
        imagePath: 'assets/images/hand.png',
        backgroundColor: AppColor.greenLight,
        icon: Icons.add,
      ),
      OnboardingItemModel(
        title: 'Buy Cripto',
        description: 'With card or bank',
        imagePath: 'assets/images/bitcoin.png',
        backgroundColor: AppColor.white,
        icon: Icons.wallet_outlined,
      ),
      OnboardingItemModel(
        title: 'Swap',
        description: 'Buy or sell tokens',
        imagePath: 'assets/images/dollar_eth.png',
        backgroundColor: AppColor.purple,
        icon: Icons.price_change_outlined,
      ),
      OnboardingItemModel(
        title: 'Send Money',
        description: 'To friends, anywhere',
        imagePath: 'assets/images/money_people.png',
        backgroundColor: AppColor.white,
        icon: Icons.send_outlined,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'What do\nyou want\nto do ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: 'today?',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                        color: AppColor.purple,
                        fontStyle: FontStyle.italic,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: onboardingItems.length,
                  itemBuilder: (context, index) {
                    final item = onboardingItems[index];
                    final isOdd = index % 2 != 0;

                    final int revealOrder = onboardingItems.length - 1 - index;

                    final double start =
                        (revealOrder * _staggerMs) /
                        _controller.duration!.inMilliseconds;
                    final double end =
                        start +
                        (_dropMs / _controller.duration!.inMilliseconds);

                    final dropAnimation = CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        start.clamp(0.0, 1.0),
                        end.clamp(0.0, 1.0),
                        curve: Curves.easeOutBack,
                      ),
                    );

                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -1.5),
                        end: Offset.zero,
                      ).animate(dropAnimation),
                      child: FadeTransition(
                        opacity: dropAnimation,
                        child: ItemOnboardingWidget(item: item, isOdd: isOdd),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
              FadeTransition(
                opacity: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.80, 1.0, curve: Curves.easeIn),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.paid_outlined, size: 40),
                    const SizedBox(width: 10),
                    Text(
                      'start your\njourney'.toUpperCase(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_right_alt_outlined, size: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
