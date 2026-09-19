import 'package:andreaproject/common_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    super.key,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 15.0,
      ),
    ),
    color: color,
    onPressed: onPressed,
  );
}

