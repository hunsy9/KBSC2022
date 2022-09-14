import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/page_provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget currentPage = context.watch<TabSelect>().currentPage;
    List<Widget> appMenu = context.watch<TabSelect>().appMenu;
    int currentTab = context.watch<TabSelect>().currentTab;

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomAppBar(
        elevation: 50,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    context.read<TabSelect>().changeTab(appMenu[0], 0);
                  },
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                            const AssetImage('assets/xhdpi/icon_donation.png'),
                            size: 25.h,
                            color: currentTab == 0 ? const Color(0xff000275) : const Color(0xffeaeaea)
                        ),
                        const SizedBox(height: 3,),
                        Text('후원처',
                          textScaleFactor: 1,
                          style: TextStyle(color: currentTab == 0 ? const Color(0xff000275) : const Color(0xff959595),
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    context.read<TabSelect>().changeTab(appMenu[1], 1);
                  },
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                            const AssetImage('assets/xhdpi/icon_home.png'),
                            size: 25.h,
                            color: currentTab == 1 ? const Color(0xff000275) : const Color(0xffeaeaea)
                        ),
                        const SizedBox(height: 3,),
                        Text('홈',
                          textScaleFactor: 1,
                          style: TextStyle(color: currentTab == 1 ? const Color(0xff000275) : const Color(0xff959595),
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    context.read<TabSelect>().changeTab(appMenu[2], 2);
                  },
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                            const AssetImage('assets/xhdpi/icon_my.png'),
                            size: 25.h,
                            color: currentTab == 2 ? const Color(0xff000275) : const Color(0xffeaeaea)
                        ),
                        const SizedBox(height: 3,),
                        Text('MY',
                          textScaleFactor: 1,
                          style: TextStyle(color: currentTab == 2 ? const Color(0xff000275) : const Color(0xff959595),
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
