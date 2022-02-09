import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.txtColor,
    required this.bgColor,
    required this.shadowColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color txtColor;
  final Color bgColor;
  final Color shadowColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PhysicalModel(
        color: Colors.grey.withOpacity(.4),
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor,
          ),
          child: Container(
            margin: const EdgeInsets.all(14),
            alignment: Alignment.center,
            child: CustomText(
              text: text,
              color: txtColor,
              size: 22,
              weight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
