import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'provider_screen')),
      ),
    );
  }
}
