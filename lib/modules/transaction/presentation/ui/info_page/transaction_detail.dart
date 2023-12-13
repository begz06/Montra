import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction_model.dart';

class TransactionDetailsPage extends StatelessWidget {
  final TransactionModel info;
  const TransactionDetailsPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Detail Transaction"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(SvgPictures.trash),
              ),
            ],
            expandedHeight: 310,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$${info.transactionPrice}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      info.subTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${info.time} October',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              background: Stack(
                children: [
                  Container(
                    height: 290,
                    decoration: BoxDecoration(
                      color: info.isExpense == 0 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 70,
                    bottom: 1,
                    width: MediaQuery.sizeOf(context).width * 0.92,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Type",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF90909F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Category",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF90909F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                info.isExpense == 1 ? "Expense" : "Income",
                                style: const TextStyle(
                                  color: Color(0xFF0D0E0F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                info.type,
                                style: const TextStyle(
                                  color: Color(0xFF0D0E0F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  const SizedBox(height: 14),
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Color(0xFF90909F),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    info.text.toString(),
                    style: const TextStyle(
                      wordSpacing: 1,
                      overflow: TextOverflow.clip,
                      color: Color(0xFF0D0E0F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Attachment",
                    style: TextStyle(
                      color: Color(0xFF90909F),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(info.image)),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          fixedSize: const Size(double.infinity, 56)),
                      child: const Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Color(0xFFFBFBFB),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
