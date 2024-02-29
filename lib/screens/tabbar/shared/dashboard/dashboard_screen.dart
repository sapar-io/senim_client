library dashboard;

import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/tabbar/brokerage/brokerage_screen.dart';
import 'package:client/screens/tabbar/certification/certification_screen.dart';
import 'package:client/screens/tabbar/home/home_screen.dart';
import 'package:client/screens/tabbar/shared/dashboard/models/dashboard_item_models.dart';
import 'package:client/screens/tabbar/logistics/logistics_screen.dart';
import 'package:client/screens/tabbar/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/config/themes/app_custom_theme.dart';
import 'package:client/constants/sm_colors.dart';

// Components
part 'widgets/sidebar.dart';
part 'widgets/toggle_sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  List<Widget> pages = const [
    HomeScreen(),
    LogisticsScreen(),
    BrokerageScreen(),
    CertificationScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _mobile(context),
      desktop: _desktop(context),
    );
  }

  Widget _desktop(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 256,
            color: Theme.of(context).own().dashboardSidebarBackground,
            child: _DashboardSidebar(
                currentIndex: _selectedIndex,
                indexPressed: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
          Expanded(
            child: pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _mobile(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: DashboardItemModel.menuItems
            .map((model) => BottomNavigationBarItem(
                icon: Icon(model.iconData), label: model.title))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
