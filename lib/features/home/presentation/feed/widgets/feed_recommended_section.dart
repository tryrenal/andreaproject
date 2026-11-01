import 'dart:math' as math;
import 'package:andreaproject/core/models/product_model.dart';
import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:andreaproject/features/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedRecommendedSection extends StatelessWidget {
  const FeedRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended for you',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _ProductCard(
                productModel: ProductModel(
                  title: 'Oat\nCappuccino',
                  rating: '4.8',
                  price: '\$5.75',
                  backgroundColor: AppPallete.pinkColor,
                  imagePath: 'assets/images/oat_cappuccino.png',
                ),
              ),
              const SizedBox(width: 16),
              _ProductCard(
                productModel: ProductModel(
                  title: 'Iced\nLatte',
                  rating: '4.6',
                  price: '\$8.75',
                  backgroundColor: AppPallete.greenColor,
                  imagePath: 'assets/images/iced_latte.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatefulWidget {
  final ProductModel productModel;

  const _ProductCard({required this.productModel});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _handleTap() async {
    if (_isNavigating) return;
    setState(() => _isNavigating = true);

    await _shakeController.forward();

    _shakeController.reset();

    if (mounted) {
      context.push(AppRouters.detail_item, extra: widget.productModel);
    }

    if (mounted) {
      setState(() => _isNavigating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: widget.productModel.backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                  animation: _shakeController,
                  builder: (context, child) {
                    final decay = math
                        .pow(1.0 - _shakeController.value, 0.5)
                        .toDouble();

                    final angle = _shakeController.value * math.pi * 12;

                    final xOffset = math.sin(angle) * 18.0 * decay;
                    final yOffset = math.cos(angle * 0.8) * 12.0 * decay;

                    final rotation = math.sin(angle * 1.1) * 0.15 * decay;

                    return Transform.translate(
                      offset: Offset(xOffset, yOffset),
                      child: Transform.rotate(angle: rotation, child: child),
                    );
                  },
                  child: Hero(
                    tag: widget.productModel.imagePath,
                    child: Image.asset(
                      widget.productModel.imagePath,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.title,
                      style: const TextStyle(
                        color: AppPallete.backgroundColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppPallete.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_border_rounded,
                            color: AppPallete.blackColor,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.productModel.rating,
                            style: const TextStyle(
                              color: AppPallete.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  decoration: BoxDecoration(
                    color: AppPallete.whiteColor.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productModel.price,
                        style: const TextStyle(
                          color: AppPallete.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: AppPallete.blackColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppPallete.whiteColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
