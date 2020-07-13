import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hanoti/routes/router.dart';
import 'package:hanoti/routes/routes_constants.dart';
import 'package:hanoti/services/repositories/client_repository.dart';
import 'package:hanoti/services/state/client_state.dart';
import 'package:hanoti/services/storage/locale_storage.dart';
import 'package:hanoti/values/colors.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPrefrences();
  await DotEnv().load('.env');
  runApp(Hanoti());
}

class Hanoti extends StatefulWidget {
  @override
  _HanotiState createState() => _HanotiState();
}

class _HanotiState extends State<Hanoti> {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<ClientState>(() => ClientState(ClientRepositoryImpl())),
      ],
      builder: (context) {
        return MaterialApp(
          title: 'Hanoti',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: brandColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Router.onGenerateRoute,
          initialRoute: homeRoute,
        );
      },
    );
  }
}
