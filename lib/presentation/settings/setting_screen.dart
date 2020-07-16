import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
        title: Text('Settings'),
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
            subtitle: Text(DotEnv().env['BASE_URL']),
            leading: Icon(Icons.rss_feed),
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
