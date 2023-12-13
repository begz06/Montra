import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/png_pictures.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/globals/widgets/home/container.dart';
import 'package:montra_app_a1/modules/home/presentation/bloc/recent_transaction/recent_transaction_bloc.dart';
import 'package:montra_app_a1/modules/home/presentation/categories/month.dart';
import 'package:montra_app_a1/modules/home/presentation/categories/today.dart';
import 'package:montra_app_a1/modules/home/presentation/categories/week.dart';
import 'package:montra_app_a1/modules/home/presentation/categories/year.dart';
import 'package:montra_app_a1/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String selectedMonth = "October";
  late TabController _tabController;



  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.06, -1.00),
                          end: Alignment(0.06, 1),
                          colors: [Color(0xFFFFF6E5), Color(0x00F7ECD7)],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2),
                                  child: Image.asset(
                                    PngImages.avatar,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    width: 50,
                                  ),
                                ),
                                CategoryDropDown(list: const [
                                  CategoryEnum.food,
                                  CategoryEnum.shopping
                                ], onChanged: (v) {}),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: GestureDetector(
                                      onTap: () async {},
                                      child: SvgPicture.asset(
                                          SvgPictures.notification)),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  "Account Balance",
                                  style: TextStyle(
                                    color: Color(0xFF90909F),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                const Text(
                                  "\$9400",
                                  style: TextStyle(
                                    color: Color(0xFF161719),
                                    fontSize: 40,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 27),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ContainerWidget(
                                      color: const Color(0xff00A86B),
                                      image: SvgPictures.income,
                                      price: "\$5000",
                                      title: "Income",
                                    ),
                                    ContainerWidget(
                                        color: const Color(0xFFFD3C4A),
                                        image: SvgPictures.expense,
                                        price: "\$1200",
                                        title: "Expense")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        "Spend Frequency",
                        style: TextStyle(
                          color: Color(0xFF0D0E0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                AspectRatio(
                  aspectRatio: 13 / 5,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 5,
                      lineBarsData: [
                        LineChartBarData(
                            spots: const [
                              FlSpot(0, 3),
                              FlSpot(1, 3.5),
                              FlSpot(2, 4),
                              FlSpot(3, 2),
                              FlSpot(4, 5),
                              FlSpot(5, 3),
                              FlSpot(8, 5),
                            ],
                            isCurved: true,
                            barWidth: 5,
                            color: primaryColor,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: false,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.5,
                ),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(
                flex: 0,
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: const Color(0xFF90909F),
                    labelColor: const Color(0xFFFCAC12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    indicator: ShapeDecoration(
                      color: const Color(0xFFFCEED3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: "Today",
                      ),
                      Tab(
                        text: "Week",
                      ),
                      Tab(
                        text: "Month",
                      ),
                      Tab(
                        text: "Year",
                      ),
                    ])),
            Expanded(
                child: TabBarView(
                    controller: _tabController, children: _categories))
          ],
        ),
      ),
    );
  }

  final List<Widget> _categories = const [
    TodayCategory(),
    WeekCategory(),
    MonthCategory(),
    YearCategory()
  ];
}
