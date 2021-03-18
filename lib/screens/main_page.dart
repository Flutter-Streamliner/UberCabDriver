import 'package:cab_driver/brand_colors.dart';
import 'package:cab_driver/screens/tabs/account_tab.dart';
import 'package:cab_driver/screens/tabs/earnings_tab.dart';
import 'package:cab_driver/screens/tabs/home_tab.dart';
import 'package:cab_driver/screens/tabs/rating_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  void _onItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = _selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomeTab(),
          EarningsTab(),
          RatingTab(),
          AccountTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: BrandColors.colorIcon,
        selectedItemColor: BrandColors.colorOrange,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.creditCard),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            label: 'Account',
          ),
        ],
        onTap: _onItemClicked,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
