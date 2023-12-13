import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerWidget extends StatelessWidget {
  final String image;
  final Color color;
  final String title;
  final String price;
  const ContainerWidget(
      {super.key,
      required this.color,
      required this.image,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 164,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(28), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                image,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFFBFBFB),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFFFBFBFB),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
