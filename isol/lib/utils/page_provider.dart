import 'package:flutter/material.dart';

import '../screens/donation/donation.dart';
import '../screens/home/home.dart';
import '../screens/my/my.dart';

class TabSelect extends ChangeNotifier {
  static GlobalKey<NavigatorState> homePageNavigationKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> donationPageNavigationKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> myPageNavigationKey = GlobalKey<NavigatorState>();

  Widget _currentPage = const Home();
  Widget get currentPage => _currentPage;

  int _currentTab = 1;
  int get currentTab => _currentTab;

  final List<Widget> _appMenu = [

    Navigator(
      key: donationPageNavigationKey,
      onGenerateRoute: (routeSetting){
        return MaterialPageRoute(
            builder: (context) => const Donation());
      },
    ),
    Navigator(
      key: homePageNavigationKey,
      onGenerateRoute: (routeSetting){
        return MaterialPageRoute(
            builder: (context) => const Home());
      },
    ),
    Navigator(
      key: myPageNavigationKey,
      onGenerateRoute: (routeSetting){
        return MaterialPageRoute(
            builder: (context) => const My());
      },
    )
  ];
  List<Widget> get appMenu => _appMenu;

  changeTab(Widget widget, int tabNum) {
    _currentPage = widget;
    _currentTab = tabNum;
    notifyListeners();
  }

}