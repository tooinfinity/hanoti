import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';
import 'package:hanoti/provider/themes.dart';
import 'package:hanoti/routes/routes_constants.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreens extends StatefulWidget {
  SplashScreens({Key key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => SplashScreen(
        seconds: 3,
        backgroundColor: notifier.darkTheme ? Colors.black : Colors.white,
        title: Text(
          getTranslate(context, 'HANOTI'),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        navigateAfterSeconds: homeRoute,
        loaderColor: notifier.darkTheme ? Colors.white : Colors.black,
      ),
    );
  }
}
