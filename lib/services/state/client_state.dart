import 'package:hanoti/services/classes/client/client.dart';
import 'package:hanoti/services/repositories/client_repository.dart';

class ClientState {
  final ClientRepository _clientRepository;

  ClientState(this._clientRepository);

  List<Client> _clients = [];
  List<Client> get clients => _clients;

  Future getAllClients() async {
    _clients = await _clientRepository.getAllClients();
  }
}
