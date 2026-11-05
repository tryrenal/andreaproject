import 'package:andreaproject/features/home/presentation/models/spending_category.dart';

class SpendingData {
  final double totalAmount;
  final String percentageChange;
  final bool isIncrease;
  final List<SpendingCategory> categories;

  SpendingData({
    required this.totalAmount,
    required this.percentageChange,
    required this.isIncrease,
    required this.categories,
  });

  double getPercentage(SpendingCategory category) {
    if (totalAmount == 0) return 0;
    return (category.amount / totalAmount) * 100;
  }
}
