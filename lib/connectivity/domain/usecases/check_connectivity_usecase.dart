import 'package:connectivity_plus/connectivity_plus.dart' show ConnectivityResult;
import 'package:processing_data/connectivity/domain/repositories/connectivity_repository.dart';

class CheckConnectivityUsecase {
  
    final ConnectivityRepository _connectivityRepository;
  
    CheckConnectivityUsecase(this._connectivityRepository);
  
    Future<ConnectivityResult> call() async => await _connectivityRepository.checkConnectivity();
  }