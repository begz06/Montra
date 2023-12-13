

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction_model.dart';
import 'package:montra_app_a1/utils/functions.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel entity;
  final VoidCallback onTap;

  const TransactionWidget({
    super.key,
    required this.entity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: InkWell(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: hexToColor(entity.colorHex),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: SvgPicture.asset(entity.iconPath),
              ),
            ),
          ),
          title: Text(
            entity.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            entity.subTitle,
            style: const TextStyle(
              color: Color(0xFF90909F),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                entity.transactionPrice.toString(),
                style: const TextStyle(
                  color: Color(0xFFFD3C4A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                safeParseDate(entity.time,pattern: 'dd.MM.yyyy hh:mm'),
                style: const TextStyle(
                  color: Color(0xFF90909F),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("0xFF$hexColor"));
  }
}
