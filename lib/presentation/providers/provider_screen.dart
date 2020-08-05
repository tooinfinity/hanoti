import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';
import 'package:hanoti/services/state/provider_state.dart';
import 'package:hanoti/widgets/error.dart';
import 'package:hanoti/widgets/initial.dart';
import 'package:hanoti/widgets/loading.dart';
import 'package:hanoti/widgets/provider_data.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ProviderScreen extends StatelessWidget {
  final _providerStateRM = RM.get<ProviderState>();

  @override
  Widget build(BuildContext context) {
    _providerStateRM.setState(
      (providerState) => providerState.getAllProviders(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'provider_screen')),
      ),
      body: SingleChildScrollView(
        child: StateBuilder<ProviderState>(
          observe: () => _providerStateRM,
          builder: (_, model) {
            return model.whenConnectionState(
              onIdle: () => buildInit(context),
              onWaiting: () => buildLoading(context),
              onData: (data) => buildProviderData(data.providers),
              onError: (error) => buildError(context, error.message),
            );
            // if (model.hasData) {
            //   return buildProviderData(model.state.providers);
            // }
            // return buildInit(context);
          },
        ),
      ),
    );
  }
}
