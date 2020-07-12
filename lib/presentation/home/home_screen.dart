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
  List<Widget> _screens = [
    ClientScreen(),
    ProviderScreen(),
    SaleScreen(),
    StatisticScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int currentIndex) {
    _screenController.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _screenController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              title: Text('Client'), icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              title: Text('provider'), icon: Icon(Icons.local_shipping)),
          BottomNavigationBarItem(
              title: Text('sale'), icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              title: Text('Statistic'), icon: Icon(Icons.pie_chart)),
          BottomNavigationBarItem(
              title: Text('Setting'), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
