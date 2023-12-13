import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCard extends StatefulWidget {
  double percentValue;
  int remainingMoney;
  String? alertText;
  Icon? alertIcon;
  String limitMoney;
  Color titleColor;
  String title;

  MyCard({
    super.key,
    required this.percentValue,
    required this.title,
    required this.titleColor,
    required this.remainingMoney,
    required this.limitMoney,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        height: 187,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: widget.titleColor,
                        size: 14,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  IconlyBold.info_circle,
                  color: Colors.red,
                ),
              ],
            ),
            Text(
              'Remaining \$${widget.remainingMoney}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            LinearPercentIndicator(
              progressColor: widget.titleColor,
              backgroundColor: Colors.grey.shade200,
              barRadius: const Radius.circular(20),
              percent: 1,
              lineHeight: 17,
            ),
            const Text(
              r'$1200 of $1000',
              style: TextStyle(
                color: Color(0xFF91919F),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              widget.limitMoney,
              style: const TextStyle(
                color: Color(
                  0xFFFD3C4A,
                ),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
