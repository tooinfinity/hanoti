import 'package:flutter/material.dart';
import 'package:hanoti/services/state/client_state.dart';
import 'package:hanoti/values/colors.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ClientScreen extends StatefulWidget {
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final _clientStateRM = RM.get<ClientState>();
  @override
  void initState() {
    _clientStateRM.setState((clientState) => clientState.getAllClients());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
      ),
      body: SingleChildScrollView(
        child: StateBuilder<ClientState>(
          observe: () => _clientStateRM,
          builder: (_, model) {
            return Column(
              children: <Widget>[
                ...model.state.clients.map((client) => Column(
                      children: <Widget>[
                        Card(
                          elevation: 8.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            decoration: BoxDecoration(color: brandColor),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
