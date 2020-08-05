import 'package:flutter/material.dart';
import 'package:hanoti/values/colors.dart';

Widget buildProviderData(data) {
  return Column(
    children: <Widget>[
      ...data.map(
        (provider) => Column(
          children: <Widget>[
            Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: brandColor),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                  title: Text(
                    '${provider.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${provider.body}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
