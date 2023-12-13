import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  const ContinueButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 56),
          backgroundColor: Color(0xFF7E3DFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Center(
        child: Text("Continue"),
      ));
}
