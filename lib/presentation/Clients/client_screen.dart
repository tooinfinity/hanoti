import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';
import 'package:hanoti/services/state/client_state.dart';
import 'package:hanoti/widgets/data.dart';
import 'package:hanoti/widgets/error.dart';
import 'package:hanoti/widgets/initial.dart';
import 'package:hanoti/widgets/loading.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ClientScreen extends StatelessWidget {

  final _clientStateRM = RM.get<ClientState>();
  
  @override
  Widget build(BuildContext context) {
    _clientStateRM.setState(
      (clientState) => clientState.getAllClients(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'client_screen')),
      ),
      body: SingleChildScrollView(
        child: StateBuilder<ClientState>(
          observe: () => _clientStateRM,
          builder: (_, model) {
            return model.whenConnectionState(
              onIdle: () => buildInit(context),
              onWaiting: () => buildLoading(context),
              onData: (data) => buildData(data.clients),
              onError: (error) => buildError(context, error.message),
            );
          },
        ),
      ),
    );
  }
}
