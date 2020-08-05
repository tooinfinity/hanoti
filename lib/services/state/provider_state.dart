import 'package:hanoti/services/classes/provider/provider.dart';
import 'package:hanoti/services/repositories/provider_repository.dart';

class ProviderState {
  final ProviderRepository _providerRepository;

  ProviderState(this._providerRepository);

  List<Provider> _providers = [];
  List<Provider> get providers => _providers;

  get provider => null;

  Future getAllProviders() async {
    _providers = await _providerRepository.getAllProviders();
  }
}
