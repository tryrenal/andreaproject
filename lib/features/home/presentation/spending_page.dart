import 'dart:math' as math;

import 'package:andreaproject/core/themes/app_color.dart';
import 'package:andreaproject/features/home/presentation/models/spending_category.dart';
import 'package:andreaproject/features/home/presentation/models/spending_data.dart';
import 'package:andreaproject/features/home/presentation/widgets/animated_counter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _chartController;
  late Animation<double> _chartAnimation;

  final SpendingData _data = SpendingData(
    totalAmount: 7683.21,
    percentageChange: "12%",
    isIncrease: true,
    categories: [
      SpendingCategory(
        name: 'Transport',
        amount: 3240.50,
        color: AppColor.greenLight,
        icon: Icons.directions_car,
      ),
      SpendingCategory(
        name: 'Food',
        amount: 1890.20,
        color: AppColor.pink,
        icon: Icons.restaurant,
      ),
      SpendingCategory(
        name: 'Shopping',
        amount: 1032.60,
        color: AppColor.purple,
        icon: Icons.shopping_bag,
      ),
      SpendingCategory(
        name: 'Travel',
        amount: 992.10,
        color: AppColor.orange,
        icon: Icons.flight,
      ),
      SpendingCategory(
        name: 'Other',
        amount: 421.30,
        color: AppColor.blue,
        icon: Icons.more_horiz,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _chartController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );

    _chartAnimation = CurvedAnimation(
      parent: _chartController,
      curve: Curves.easeInOutSine,
    );
    _chartController.forward();
  }

  @override
  void dispose() {
    _chartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              _buildChart(),
              const SizedBox(height: 40),
              ..._data.categories.asMap().entries.map((entry) {
                final index = entry.key;
                final category = entry.value;
                return _buildListItem(category, index);
              }),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View activity details',
                  style: TextStyle(
                    color: AppColor.greyDark.withValues(alpha: 0.5),
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _chartAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: const Size(300, 300),
                painter: DonutChartPainter(
                  categories: _data.categories,
                  total: _data.totalAmount,
                  animationValue: _chartAnimation.value,
                ),
              );
            },
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: AppColor.greyLight.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedCounter(
                value: _data.totalAmount,
                duration: const Duration(milliseconds: 2500),
                wholeStyle: const TextStyle(
                  color: AppColor.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
                decimalStyle: const TextStyle(
                  color: AppColor.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _data.isIncrease ? AppColor.greenDark : AppColor.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _data.isIncrease
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      color: _data.isIncrease
                          ? AppColor.greenLight
                          : AppColor.red,
                      size: 18,
                    ),
                    Text(
                      _data.percentageChange,
                      style: TextStyle(
                        color: _data.isIncrease
                            ? AppColor.greenLight
                            : AppColor.red,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(SpendingCategory category, int index) {
    final percentage = _data.getPercentage(category);

    final totalItems = _data.categories.length;
    final segmentStart = index / totalItems;
    final segmentEnd = (index + 1) / totalItems;

    final itemAnimation = CurvedAnimation(
      parent: _chartController,
      curve: Interval(segmentStart, segmentEnd, curve: Curves.linear),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: category.color,
              shape: BoxShape.circle,
            ),
            child: Icon(category.icon, color: AppColor.black, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-0.5, 0),
                end: Offset.zero,
              ).animate(itemAnimation),
              child: FadeTransition(
                opacity: itemAnimation,
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          AnimatedBuilder(
            animation: itemAnimation,
            builder: (context, child) {
              final animatedAmount = category.amount * itemAnimation.value;
              final animatedPercentage = percentage * itemAnimation.value;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedCounter(
                    value: animatedAmount,
                    duration: Duration.zero,
                    prefix: '\$',
                    wholeStyle: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    decimalStyle: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Text(
                    '${animatedPercentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: AppColor.greyLight.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(width: 8),
          Icon(
            Icons.chevron_right,
            color: AppColor.greyLight.withValues(alpha: 0.4),
            size: 20,
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    final str = amount.toStringAsFixed(2);
    final parts = str.split('.');
    final wholePart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '\$$wholePart.${parts[1]}';
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: InkWell(
          onTap: () => context.pop(),
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            child: const Icon(Icons.arrow_back, color: AppColor.black),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 16),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: const Icon(Icons.history, color: AppColor.black),
            ),
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: const Text(
          'Your Spending',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<SpendingCategory> categories;
  final double total;
  final double animationValue;

  DonutChartPainter({
    required this.categories,
    required this.total,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = size.width * 0.10;
    final rect = Rect.fromCircle(
      center: center,
      radius: radius - strokeWidth / 2,
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -math.pi / 2;
    final totalSweep = 2 * math.pi;

    final segmentDuration = 1.0 / categories.length;

    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];
      paint.color = category.color;

      double sweepAngle = (category.amount / total) * totalSweep;

      if (i == categories.length - 1) {
        final endAngle = -math.pi / 2;
        sweepAngle = endAngle - startAngle;
        if (sweepAngle <= 0) {
          sweepAngle += totalSweep;
        }
      }

      final segmentStart = i * segmentDuration;
      final segmentEnd = (i + 1) * segmentDuration;

      double localProgress = 0.0;
      if (animationValue >= segmentEnd) {
        localProgress = 1.0;
      } else if (animationValue > segmentStart) {
        localProgress = (animationValue - segmentStart) / segmentDuration;
      }

      final drawableSweep = sweepAngle * localProgress;

      if (drawableSweep > 0) {
        canvas.drawArc(rect, startAngle, drawableSweep, false, paint);
      }

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.total != total ||
        oldDelegate.categories != categories ||
        oldDelegate.animationValue != animationValue;
  }
}
