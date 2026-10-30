import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:andreaproject/features/auth/presentation/models/onboarding_ui_model.dart';
import 'package:andreaproject/features/auth/presentation/widgets/onboarding_caraousel.dart';
import 'package:andreaproject/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => OnboardingPage());
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<OnboardingUiModel> data = [
    OnboardingUiModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcxnvEk5bMSHyfZH2RemAwrGWlPTGJ_WUt64ah_2Bd4Q&s=10',
      price: 4.65,
      label: 'Your daily pour',
      name: 'Oat Cappucino',
    ),
    OnboardingUiModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs1oMtI_xoyjknk3dwr0n6BWN9jctN7r2DJTPBuVtaA&s=10',
      price: 5.00,
      label: 'enjoyable',
      name: 'Oat Latter',
    ),
    OnboardingUiModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8t5riYr65jbho1ERXWb45ykWXjwjm8cTDo1XjRhKT_Q&s=10',
      price: 5.15,
      label: 'drink know',
      name: 'Milk',
    ),
    OnboardingUiModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbp755g65Zd_6qLhGqQQ84VmD_vS5r2PSdNOenhNo8IA&s=10',
      price: 7.85,
      label: 'Booster',
      name: 'Pink Lava',
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: OnboardingCaraousel(
                  data: data,
                  currentIndex: currentIndex,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPallete.whiteColor,
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              HomePage.route(),
                              (route) => false,
                            );
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: AppPallete.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: 'Have an account? ',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppPallete.greyColor,
                              fontWeight: FontWeight.w300,
                            ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: AppPallete.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
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
}
