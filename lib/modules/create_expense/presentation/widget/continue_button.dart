import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>  Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(16.0)),
          color: Color(0xff7F3DFF),
          border: Border.all(color: Color(0xff91919F))),
      child: Center(
        child: Text(
          "Continue",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffFCFCFC)),
        ),
      ),
    ),
  );
}
