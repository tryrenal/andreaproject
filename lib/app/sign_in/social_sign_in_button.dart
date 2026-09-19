import '../../common_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    super.key,
    required String assetName,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(assetName),
        Text(
          text,
          style: TextStyle(color: textColor, fontSize: 15.0),
        ),
        Opacity(
          opacity: 0.0,
          child: Image.asset(assetName),
        ),
      ],
    ),
    color: color,
    onPressed: onPressed,
  );
}

