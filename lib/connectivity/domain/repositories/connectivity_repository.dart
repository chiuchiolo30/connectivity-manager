import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityRepository {
  
  Future<ConnectivityResult> checkConnectivity();
  void connectivityUnSubscription();
  Stream<ConnectivityResult> connectivitySubscription();
}