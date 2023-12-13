import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:montra_app_a1/assets/constants/app_icons.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';

import 'package:montra_app_a1/modules/create_expense/presentation/widget/image_picker_bottomsheet.dart';
import 'package:montra_app_a1/modules/navigation/model/navbar.dart';
import 'package:montra_app_a1/modules/navigation/presentation/navigator.dart';
import 'package:montra_app_a1/modules/navigation/presentation/widgets/nav_bar_item.dart';

enum NavItemEnum { home, search, favourite, profile }



class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const NavigationScreen());

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  bool isShowing = false;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.search: GlobalKey<NavigatorState>(),
    NavItemEnum.favourite: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];
  int _currentIndex = 0;
  DateTime? pauseTime;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);

    _controller.addListener(onTabChange);

    super.initState();
  }

  void onTabChange() => setState(() => _currentIndex = _controller.index);

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = [
      const NavBar(label: 'Home',
        id: 0,

        icon: AppIcons.home,
      ),
      const NavBar(label: 'Transaction',
        id: 1,
        icon: AppIcons.transaction,
      ),
      const NavBar(
        label: 'Budget',
        id: 2,
        icon: AppIcons.budget,
      ),
      const NavBar(
        label: 'Settings',
        id: 3,
        icon: AppIcons.person,
      ),
    ];
    return HomeTabControllerProvider(
      controller: _controller,
      child: WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                  .currentState!
                  .maybePop();
          if (isFirstRouteInCurrentTab) {
            if (NavItemEnum.values[_currentIndex] != NavItemEnum.home) {
              changePage(0);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        },
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
          child: Scaffold(
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: FloatingActionButton(
            //     onPressed: () {
            //       isShowing = !isShowing;
            //       isShowing ? showImagePickerBottomSheet(context) : const SizedBox();
            //       setState(() {});
            //     },
            //     child: Container(
            //       height: 56,
            //       width: 56,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle, color: primaryColor),
            //       child: Center(child: Icon(isShowing ? Icons.close : Icons.add)
            //           //  SvgPicture.asset(
            //           //   isShowing ? AppIcons.close : AppIcons.plus,
            //           //   width: 40,
            //           //   height: 40,
            //           // ),
            //           ),
            //     )),
            backgroundColor: Colors.white,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                showImagePickerBottomSheet(context);
              },
              child: Container(
                height: 56,
                width: 56,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: Center(
                  child: SvgPicture.asset(AppIcons.plus,width: 45,height: 45,),
                ),
              ),
            ),
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              height: 73+MediaQuery.of(context).padding.bottom,
               decoration: const BoxDecoration(
                 boxShadow: []
               ),
              clipBehavior: Clip.antiAlias,

              child: TabBar(
                enableFeedback: true,
                onTap: (index) {},
                indicatorColor: Colors.transparent,
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: List.generate(
                  labels.length,
                  (index) => NavItemWidget(
                    navBar: labels[index],
                    currentIndex: _currentIndex,
                  ),
                ),
              ),
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPageNavigator(NavItemEnum.home),
                _buildPageNavigator(NavItemEnum.search),
                _buildPageNavigator(NavItemEnum.favourite),
                _buildPageNavigator(NavItemEnum.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  static HomeTabControllerProvider of(BuildContext context) {
    final HomeTabControllerProvider? result =
        context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
