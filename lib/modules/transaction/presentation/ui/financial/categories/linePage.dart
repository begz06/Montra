import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/utils/enums.dart';

class LinePage extends StatefulWidget {
  const LinePage({super.key});

  @override
  State<LinePage> createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '\$ 332',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.8,
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
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabAlignment: TabAlignment.fill,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                indicator: ShapeDecoration(
                  color: primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(32),
                      right: Radius.circular(32),
                    ),
                  ),
                ),
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Expense",
                  ),
                  Tab(
                    text: "Income",
                  )
                ]),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              //// Expense
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       CategoryDropDown(list: [CategoryEnum.food,CategoryEnum.shopping], onChanged: (v) {}),
                        GestureDetector(
                          onTap: () {},
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
                              child: SvgPicture.asset(SvgPictures.sort1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: CustomScrollView(
                    //     slivers: [
                    //       SliverList(
                    //         delegate: SliverChildBuilderDelegate(
                    //           (context, index) => TransactionWidget(
                    //             onTap: () => print(index),
                    //             color: TransactionScreen().colors[0],
                    //             image: TransactionScreen().images[0],
                    //             price: TransactionScreen().prices[0],
                    //             subtitle: TransactionScreen().subtitles[0],
                    //             time:
                    //                 "${DateTime.now().toString().substring(11, 16)} PM",
                    //             title: TransactionScreen().titles[0],
                    //           ),
                    //           childCount: 15,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),

              //// Income
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       CategoryDropDown(list: [CategoryEnum.food,CategoryEnum.shopping], onChanged: (v) {}),
                        GestureDetector(
                          onTap: () {},
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
                              child: SvgPicture.asset(SvgPictures.sort1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: CustomScrollView(
                    //     slivers: [
                    //       SliverList(
                    //         delegate: SliverChildBuilderDelegate(
                    //           (context, index) => TransactionWidget(
                    //             onTap: () => print(index),
                    //             color: TransactionScreen().colors[1],
                    //             image: TransactionScreen().images[1],
                    //             price: TransactionScreen().prices[1],
                    //             subtitle: TransactionScreen().subtitles[1],
                    //             time:
                    //                 "${DateTime.now().toString().substring(11, 16)} PM",
                    //             title: TransactionScreen().titles[1],
                    //           ),
                    //           childCount: 15,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
