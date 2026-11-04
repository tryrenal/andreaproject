import 'package:andreaproject/core/themes/app_color.dart';
import 'package:andreaproject/features/auth/presentation/models/onboarding_item_model.dart';
import 'package:andreaproject/features/auth/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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
              SizedBox(height: 40),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: onboardingItems.length,
                  itemBuilder: (context, index) {
                    final item = onboardingItems[index];
                    final isOdd = index % 2 != 0;
                    return ItemOnboardingWidget(item: item, isOdd: isOdd);
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.paid_outlined, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'start your\njourney'.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_right_alt_outlined, size: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
