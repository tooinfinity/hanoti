import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(getTranslate(context, 'page_not_found')),
      ),
    );
  }
}
