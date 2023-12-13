import 'package:flutter/material.dart';

class MyBottomSheetWidget extends StatelessWidget {
  final String text;
  final bool istapped;

  final VoidCallback onTap;

  MyBottomSheetWidget(
      {super.key,
      required this.text,
      required this.istapped,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 42,
        width: 98,
        decoration: ShapeDecoration(
            color: istapped ? const Color(0xFFEEE5FF) : const Color(0xFFE3E5E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: istapped ? const Color(0xFF7E3DFF) : Color(0xFF0D0E0F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
