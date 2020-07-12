import 'package:flutter/material.dart';
import 'package:hanoti/routes/router.dart';
import 'package:hanoti/routes/routes_constants.dart';
import 'package:hanoti/services/storage/locale_storage.dart';
import 'package:hanoti/values/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPrefrences();
  runApp(Hanoti());
}

class Hanoti extends StatefulWidget {
  @override
  _HanotiState createState() => _HanotiState();
}

class _HanotiState extends State<Hanoti> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanoti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: brandColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.onGenerateRoute,
      initialRoute: homeRoute,
    );
  }
}
