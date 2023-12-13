import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/globals/widgets/home/transaction_item.dart';
import 'package:montra_app_a1/modules/home/presentation/bloc/recent_transaction/recent_transaction_bloc.dart';

import 'package:montra_app_a1/modules/transaction/presentation/ui/financial/financialReportPage.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/info_page/transaction_detail.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/widgets/my_bottom_sheet.dart';
import 'package:montra_app_a1/utils/enums.dart';
import 'package:montra_app_a1/utils/functions.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFF1F1FA),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: CategoryDropDown(list: const [
                        CategoryEnum.food,
                        CategoryEnum.shopping
                      ], onChanged: (v) {}),
                    ),
                    GestureDetector(
                      onTap: () {
                        showFilterBottomSheet(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF1F1FA),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(SvgPictures.sort),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => const FinancialReportPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE5FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "See your financial report",
                            style: TextStyle(
                              color: Color(0xFF7E3DFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff7F3DFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: BlocBuilder<RecentTransactionBloc, RecentTransactionState>(
              builder: (context, state) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      var date = '';
                      calculateDayTitle(state, index, onChange: (newDate) {
                        date = newDate;
                      });

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (date.isNotEmpty)
                            Text(
                              date,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: mainDark),
                            ),
                          const SizedBox(
                            height: 4,
                          ),
                          TransactionWidget(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (c) => TransactionDetailsPage(
                                        info: state.list[index]))),
                            entity: state.list[index],
                            // state.list[index],
                          ),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
