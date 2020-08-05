import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';

Widget buildInit(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 100,
    child: Center(
      child: Text(getTranslate(context, 'searching')),
    ),
  );
}
