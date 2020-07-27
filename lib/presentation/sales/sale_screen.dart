import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'sale_screen')),
      ),
    );
  }
}
