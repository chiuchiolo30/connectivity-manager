import 'package:connectivity_plus/connectivity_plus.dart' show ConnectivityResult;
import 'package:processing_data/connectivity/domain/repositories/connectivity_repository.dart';

import '../datasources/local/connectivity_local_datasource.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  
  final ConnectivityLocalDataSource _dataSourceLocal;

  ConnectivityRepositoryImpl(this._dataSourceLocal);

  @override
  Future<ConnectivityResult> checkConnectivity() async => await _dataSourceLocal.checkConnectivity();
  
  @override
  Stream<ConnectivityResult> connectivitySubscription() async* {
    yield* _dataSourceLocal.connectivitySubscription();
  }
  
  @override
  void connectivityUnSubscription()  { _dataSourceLocal.connectivityUnSubscription(); }
  
}