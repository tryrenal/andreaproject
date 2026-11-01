import 'package:andreaproject/core/models/product_model.dart';
import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailItemPage extends StatelessWidget {
  final ProductModel product;
  const DetailItemPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 30,
                  right: 1,
                  left: 1,
                  child: Text(
                    product.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withValues(alpha: 0.1),
                      height: 0.9,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    height: 400,
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppPallete.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          Positioned(
            top: 320,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppPallete.backgroundColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppPallete.greenColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.coffee_outlined,
                                      color: AppPallete.blackColor,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Barista's Choice",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    product.price,
                                    style: TextStyle(
                                      color: AppPallete.greenColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "\$5.75",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Text(
                            product.title.replaceAll('\n', ' '),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoBox(
                                  title: "${product.rating}/5",
                                  subtitle: "230 reviews",
                                  iconRow: Row(
                                    children: List.generate(
                                      5,
                                      (index) => const Icon(
                                        Icons.star_border,
                                        color: Colors.white54,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildInfoBox(
                                  title: "AI pick",
                                  subtitle: "Oat milk · Vanilla",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          Row(
                            children: [
                              _buildSizeButton(
                                "Small",
                                isSelected: true,
                                color: AppPallete.greenColor,
                              ),
                              const SizedBox(width: 12),
                              _buildSizeButton(
                                "Medium",
                                isSelected: false,
                                color: AppPallete.greenColor,
                              ),
                              const SizedBox(width: 12),
                              _buildSizeButton(
                                "Large",
                                isSelected: false,
                                color: AppPallete.greenColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "Smooth espresso balanced with steamed milk and light layer of foam",
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.5,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(
                      24,
                      10,
                      24,
                      MediaQuery.of(context).padding.bottom + 20,
                    ),
                    color: AppPallete.backgroundColor,
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add to Basket",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String subtitle,
    Widget? iconRow,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.blackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (iconRow != null) ...[const SizedBox(height: 4), iconRow],
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(
    String label, {
    required bool isSelected,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color : AppPallete.blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
