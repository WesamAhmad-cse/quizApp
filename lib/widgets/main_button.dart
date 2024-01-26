import 'package:flutter/material.dart';
import 'package:quiz_app/utills/app_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.black,
          foregroundColor: AppColor.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text),
      ),
    );
  }
}
