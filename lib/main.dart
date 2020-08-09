import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hanoti/localization/app_localization.dart';
import 'package:hanoti/provider/language.dart';
import 'package:hanoti/provider/themes.dart';
import 'package:hanoti/routes/router.dart';
import 'package:hanoti/routes/routes_constants.dart';
import 'package:hanoti/services/repositories/client_repository.dart';
import 'package:hanoti/services/repositories/provider_repository.dart';
import 'package:hanoti/services/state/client_state.dart';
import 'package:hanoti/services/state/provider_state.dart';
import 'package:hanoti/services/storage/locale_storage.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPrefrences();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await DotEnv().load('.env');
  runApp(Hanoti());
}

class Hanoti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<ClientState>(() => ClientState(ClientRepositoryImpl())),
        Inject<ProviderState>(() => ProviderState(ProviderRepositoryImpl())),
      ],
      builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeNotifier>(
                create: (_) => ThemeNotifier()),
            ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ],
          child: Consumer2<ThemeNotifier, AppLanguage>(
            builder: (context, ThemeNotifier notifier, AppLanguage appLanguage,
                child) {
              return MaterialApp(
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('fr', 'FR'),
                  Locale('ar', 'DZ')
                ],
                locale: Provider.of<AppLanguage>(context).appLocal,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supporedLocales) {
                  for (var locale in supporedLocales) {
                    if (locale.languageCode == deviceLocale.languageCode &&
                        locale.countryCode == deviceLocale.countryCode) {
                      return deviceLocale;
                    }
                  }
                  return supporedLocales.first;
                },
                title: 'Hanoti',
                debugShowCheckedModeBanner: false,
                theme: notifier.darkTheme ? dark : light,
                onGenerateRoute: Router.onGenerateRoute,
                initialRoute: splashScreenRoute,
              );
            },
          ),
        );
      },
    );
  }
}
