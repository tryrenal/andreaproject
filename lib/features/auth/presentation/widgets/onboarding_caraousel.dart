import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:andreaproject/core/utils/string_util.dart';
import 'package:andreaproject/features/auth/presentation/models/onboarding_ui_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingCaraousel extends StatelessWidget {
  final List<OnboardingUiModel> data;
  final int currentIndex;
  final Function(int) onPageChanged;

  const OnboardingCaraousel({
    super.key,
    required this.data,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselSlider(
              items: data
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(item.image, fit: BoxFit.cover),
                            Positioned(
                              top: 20,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppPallete.backgroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      color: AppPallete.whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 8, 5, 8),
                                decoration: BoxDecoration(
                                  color: AppPallete.backgroundColor.withValues(
                                    alpha: 0.6,
                                  ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        color: AppPallete.whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          StringUtil.doubleToStringDollarCurrency(
                                            item.price,
                                          ),
                                          style: TextStyle(
                                            color: AppPallete.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            color: AppPallete.blackColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppPallete.whiteColor,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: double.infinity,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  onPageChanged(index);
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.asMap().entries.map((item) {
              bool isActive = currentIndex == item.key;
              return Container(
                height: isActive ? 15 : 5,
                width: isActive ? 15 : 10,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isActive ? Colors.transparent : AppPallete.greyColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: isActive
                    ? Image.asset(
                        'assets/icons/ic_star.png',
                        color: AppPallete.whiteColor,
                        colorBlendMode: BlendMode.srcIn,
                      )
                    : null,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
