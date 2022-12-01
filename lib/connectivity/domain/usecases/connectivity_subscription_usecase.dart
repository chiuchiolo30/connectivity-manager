import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:processing_data/connectivity/domain/repositories/connectivity_repository.dart';

class ConnectivitySubscriptionUsecase {
  
    final ConnectivityRepository _connectivityRepository;
  
    ConnectivitySubscriptionUsecase(this._connectivityRepository);
  
    Stream<ConnectivityResult> call() async*  {
        yield* _connectivityRepository.connectivitySubscription();
      }
  }