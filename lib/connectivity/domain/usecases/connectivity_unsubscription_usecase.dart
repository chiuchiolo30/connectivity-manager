  import 'package:processing_data/connectivity/domain/repositories/connectivity_repository.dart';

class ConnectivityUnsubscriptionUsecase {
  
    final ConnectivityRepository _connectivityRepository;
  
    ConnectivityUnsubscriptionUsecase(this._connectivityRepository);
  
    void call() => _connectivityRepository.connectivityUnSubscription();
  }