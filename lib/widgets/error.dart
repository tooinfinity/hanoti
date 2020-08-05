import 'package:flutter/cupertino.dart';

Widget buildError(context, error) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 100,
    child: Center(
      child: Text('$error'),
    ),
  );
}
