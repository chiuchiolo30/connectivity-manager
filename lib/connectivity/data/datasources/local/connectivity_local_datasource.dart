import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

abstract class ConnectivityLocalDataSource {
  
  Future<ConnectivityResult> checkConnectivity();
  void connectivityUnSubscription();
  Stream<ConnectivityResult>connectivitySubscription();
}

class ConnectivityLocalDataSourceImpl implements ConnectivityLocalDataSource {
  final connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  final StreamController<ConnectivityResult> _connectivityResult = StreamController<ConnectivityResult>.broadcast();

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    // final connectivity = Connectivity();
    
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (_) {
      return ConnectivityResult.none;
    }
    return result;
  }
  
  @override
  Stream<ConnectivityResult> connectivitySubscription() async* {
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((event) { 
      _connectivityResult.add(event);
    });
    yield* _connectivityResult.stream;
  }
  
  @override
  void connectivityUnSubscription() {
    _connectivitySubscription?.cancel();
  }
  
}