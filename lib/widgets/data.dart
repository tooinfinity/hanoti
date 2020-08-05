import 'package:flutter/material.dart';
import 'package:hanoti/values/colors.dart';

Widget buildData(data) {
  return Column(
    children: <Widget>[
      ...data.map(
        (client) => Column(
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
                    '${client.name}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${client.email}',
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
