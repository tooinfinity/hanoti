import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hanoti/localization/language_consts.dart';
import 'package:hanoti/provider/language.dart';
import 'package:hanoti/provider/themes.dart';
import 'package:hanoti/services/models/language.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  final Language language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'setting_screen')),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => SwitchListTile(
              title: Text(getTranslate(context, 'dark_mode')),
              value: notifier.darkTheme,
              onChanged: (val) {
                notifier.toggleTheme();
              },
            ),
          ),
          ListTile(
            title: Text(getTranslate(context, 'server_name')),
            subtitle: Text(DotEnv().env['BASE_URL']),
            leading: Icon(Icons.rss_feed),
          ),
          Consumer<AppLanguage>(
            builder: (context, appLanguage, child) => ListTile(
              title: Text(getTranslate(context, 'select_lang')),
              leading: Icon(Icons.translate),
              trailing: DropdownButton<String>(
                  value: appLanguage.localeToString(appLanguage.appLocal),
                  icon: Icon(
                    Icons.arrow_downward,
                  ),
                  iconSize: 20,
                  elevation: 0,
                  underline: Container(
                    height: 1,
                  ),
                  onChanged: (String newValue) {
                    appLanguage.changeLanguage(newValue);
                  },
                  items: language.languagesListDefault
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
