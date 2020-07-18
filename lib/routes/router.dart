import 'package:flutter/material.dart';
import 'package:hanoti/presentation/Clients/client_screen.dart';
import 'package:hanoti/presentation/home/home_screen.dart';
import 'package:hanoti/presentation/not_found/not_found_screen.dart';
import 'package:hanoti/presentation/providers/provider_screen.dart';
import 'package:hanoti/presentation/sales/sale_screen.dart';
import 'package:hanoti/presentation/settings/setting_screen.dart';
import 'package:hanoti/presentation/splash_screen/splash_screen.dart';
import 'package:hanoti/presentation/statistics/statistic_screen.dart';
import 'package:hanoti/routes/routes_constants.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreens(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case clientRoute:
        return MaterialPageRoute(
          builder: (_) => ClientScreen(),
        );
      case providerRoute:
        return MaterialPageRoute(
          builder: (_) => ProviderScreen(),
        );
      case saleRoute:
        return MaterialPageRoute(
          builder: (_) => SaleScreen(),
        );
      case statisticRoute:
        return MaterialPageRoute(
          builder: (_) => StatisticScreen(),
        );
      case settingRoute:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );

        break;
      default:
        return MaterialPageRoute(
          builder: (_) => NotFoundScreen(),
        );
    }
  }
}
