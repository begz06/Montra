import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/globals/widgets/home/category_widget.dart';
import 'package:montra_app_a1/utils/enums.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _LinePageState();
}

class _LinePageState extends State<ChartPage> with TickerProviderStateMixin {
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
              SizedBox(
                height: 240,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(
                        show: false,
                        border: Border.all(width: 1, color: Colors.black)),
                    sections: getSections(), // Define your chart data here
                    centerSpaceRadius: 40,
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
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 21),
                                child: CategoryWidget(
                                    categoryColor: Colors.orange,
                                    price: "-\$120",
                                    percent: 5 / 10,
                                    title: "Shopping"),
                              ),
                              childCount: 15,
                            ),
                          ),
                        ],
                      ),
                    )
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
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 21),
                                child: CategoryWidget(
                                    categoryColor: Colors.orange,
                                    price: "-\$120",
                                    percent: 5 / 10,
                                    title: "Shopping"),
                              ),
                              childCount: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        color: Colors.orange, // Define the color of the section
        value: 25, // Define the value of the section
      ),
      PieChartSectionData(
        color: primaryColor,
        value: 40,
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 30,
      ),
    ];
  }
}
