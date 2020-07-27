import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'statistic_screen')),
      ),
    );
  }
}
