import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/financial/categories/chartPage.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/financial/categories/linePage.dart';
import 'package:montra_app_a1/utils/enums.dart';

class FinancialReportPage extends StatefulWidget {
  const FinancialReportPage({super.key});

  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Color(0xFF212224),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        title: const Text("Financial Report"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryDropDown(list: [CategoryEnum.food,CategoryEnum.shopping], onChanged: (v) {}),
                TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xFF90909F),
                  tabAlignment: TabAlignment.center,
                  indicator: ShapeDecoration(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: _currenIndex == 0
                              ? const Radius.circular(8)
                              : Radius.zero,
                          right: _currenIndex == 1
                              ? const Radius.circular(8)
                              : Radius.zero),
                    ),
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  onTap: (value) {
                    _currenIndex = value;
                    setState(() {});
                  },
                  tabs: [
                    Tab(
                      child: SvgPicture.asset(
                        SvgPictures.line,
                        color:
                            _currenIndex == 0 ? Colors.white : primaryColor,
                      ),
                    ),
                    Tab(
                      child: SvgPicture.asset(
                        SvgPictures.chart,
                        color:
                            _currenIndex == 1 ? Colors.white : primaryColor,
                      ),
                    )
                  ],
                  controller: _tabController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: _screens,
            ),
          )
        ],
      ),
    );
  }

  final List<Widget> _screens = const [LinePage(), ChartPage()];
}
