import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});
  final onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(AppColors.secondaryColor)),
        icon: Icon(icon),
        label: Text(text));
  }
}
