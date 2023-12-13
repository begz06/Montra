import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String price;
  final Color categoryColor;
  final double percent;

  const CategoryWidget(
      {super.key,
      required this.categoryColor,
      required this.price,
      required this.percent,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 34.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border:
                        Border.all(width: 1, color: const Color(0xFFF1F1FA))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: ShapeDecoration(
                          color: categoryColor,
                          shape: const OvalBorder(),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            color: Color(0xFF212224),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFFFD3C4A),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
              height: 15,
              width: double.infinity,
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                backgroundColor: const Color(0xffF1F1FA),
                progressColor: categoryColor,
                percent: percent,
              ))
        ],
      ),
    );
  }
}
