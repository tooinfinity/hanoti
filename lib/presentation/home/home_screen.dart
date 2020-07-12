import 'package:flutter/material.dart';
import 'package:hanoti/presentation/Clients/client_screen.dart';
import 'package:hanoti/presentation/providers/provider_screen.dart';
import 'package:hanoti/presentation/sales/sale_screen.dart';
import 'package:hanoti/presentation/settings/setting_screen.dart';
import 'package:hanoti/presentation/statistics/statistic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _screenController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    ClientScreen(),
    ProviderScreen(),
    SaleScreen(),
    StatisticScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int currentIndex) {
    _screenController.jumpToPage(currentIndex);
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _screenController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(
                'Client',
                style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.red : Colors.grey),
              ),
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 0 ? Colors.red : Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text(
                'provider',
                style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.red : Colors.grey),
              ),
              icon: Icon(
                Icons.local_shipping,
                color: _selectedIndex == 1 ? Colors.red : Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text(
                'sale',
                style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.red : Colors.grey),
              ),
              icon: Icon(
                Icons.shopping_cart,
                color: _selectedIndex == 2 ? Colors.red : Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text(
                'Statistic',
                style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.red : Colors.grey),
              ),
              icon: Icon(
                Icons.pie_chart,
                color: _selectedIndex == 3 ? Colors.red : Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text(
                'Setting',
                style: TextStyle(
                    color: _selectedIndex == 4 ? Colors.red : Colors.grey),
              ),
              icon: Icon(
                Icons.settings,
                color: _selectedIndex == 4 ? Colors.red : Colors.grey,
              )),
        ],
      ),
    );
  }
}
