import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final double value;
  final Duration duration;
  final TextStyle? wholeStyle;
  final TextStyle? decimalStyle;
  final String prefix;
  final int decimalPlaces;
  const AnimatedCounter({
    super.key,
    required this.value,
    this.duration = const Duration(seconds: 2),
    this.wholeStyle,
    this.decimalStyle,
    this.prefix = "\$",
    this.decimalPlaces = 2,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, _) {
        final whole = animatedValue.floor();
        final showDecimals = decimalStyle != null;
        final decimal = ((animatedValue - whole) * 100).round();
        final formattedWhole = _addCommas(whole.toString());
        final formattedDecimal = decimal.toString().padLeft(decimalPlaces, '0');
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '$prefix$formattedWhole', style: wholeStyle),
              if (showDecimals)
                TextSpan(text: '.$formattedDecimal', style: decimalStyle),
            ],
          ),
        );
      },
    );
  }

  String _addCommas(String number) {
    final buffer = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      if (i > 0 && (number.length - i) % 3 == 0) buffer.write(',');
      buffer.write(number[i]);
    }
    return buffer.toString();
  }
}
