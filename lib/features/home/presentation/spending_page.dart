import 'dart:math' as math;

import 'package:andreaproject/core/themes/app_color.dart';
import 'package:andreaproject/features/home/presentation/models/spending_category.dart';
import 'package:andreaproject/features/home/presentation/models/spending_data.dart';
import 'package:flutter/material.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
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
              ..._data.categories.map((category) => _buildListItem(category)),
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
          CustomPaint(
            size: const Size(300, 300),
            painter: DonutChartPainter(
              categories: _data.categories,
              total: _data.totalAmount,
            ),
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
              Text(
                _formatCurrency(_data.totalAmount),
                style: const TextStyle(
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

  Widget _buildListItem(SpendingCategory category) {
    final percentage = _data.getPercentage(category);

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
            child: Text(
              category.name,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            _formatCurrency(category.amount),
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              color: AppColor.greyLight.withValues(alpha: 0.5),
              fontSize: 14,
            ),
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
          onTap: () => Navigator.pop(context),
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

  DonutChartPainter({required this.categories, required this.total});

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
    const gapAngle = 0.05;

    for (var category in categories) {
      paint.color = category.color;

      final sweepAngle = (category.amount / total) * (2 * math.pi);

      canvas.drawArc(
        rect,
        startAngle + (gapAngle / 2),
        sweepAngle - gapAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.total != total || oldDelegate.categories != categories;
  }
}
