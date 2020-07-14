import 'package:flutter/material.dart';
import 'package:hanoti/provider/themes.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTING'),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => SwitchListTile(
              title: Text('Dark Mode'),
              value: notifier.darkTheme,
              onChanged: (val) {
                notifier.toggleTheme();
              },
            ),
          ),
          ListTile(
            title: Text('Server Name'),
            subtitle: Text('entrer you server name'),
            leading: Icon(Icons.rss_feed),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: Text("Alert Dialog title"),
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Put your Server Name here',
                      hintText: 'serverName',
                    ),
                  ),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("Save"),
                      onPressed: () {
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          ListTile(
            title: Text('Language'),
            leading: Icon(Icons.language),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
