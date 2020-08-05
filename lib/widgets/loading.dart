import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildLoading(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
