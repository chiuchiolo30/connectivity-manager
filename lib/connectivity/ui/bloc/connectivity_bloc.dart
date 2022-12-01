import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:processing_data/connectivity/domain/usecases/usecases.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {

  final CheckConnectivityUsecase _checkConnectivity;
  final ConnectivitySubscriptionUsecase _connectivitySubscription;
  final ConnectivityUnsubscriptionUsecase _connectivityUnSubscription;

  StreamSubscription<ConnectivityResult>? connectivityStreamSubscription;

  ConnectivityBloc({ 
    required CheckConnectivityUsecase checkConnectivityUsecase,
    required ConnectivitySubscriptionUsecase connectivitySubscription,
    required ConnectivityUnsubscriptionUsecase connectivityUnSubscription
     }) : 
     _checkConnectivity           = checkConnectivityUsecase, 
     _connectivitySubscription    = connectivitySubscription, 
     _connectivityUnSubscription  = connectivityUnSubscription, 
     super(const ConnectivityState( connectionStatus: ConnectivityResult.none )) {
    
    on<ConnectivityEvent>((event, emit) async {
      if(event is ChangeStatus)               await changeStatus(event, emit);
      if(event is StartFollowingConnectivity) await startFollowingConnectivity(event, emit);
      if(event is InternetAccess)             await internetAccess(event, emit);
      
    },
    transformer: sequential()
    );

    _init();
    
  }

  Future<void> _init() async {
    final currentStatus = await _checkConnectivity();
    add(ChangeStatus(currentStatus));
  }

  Future changeStatus(ChangeStatus event, Emitter emit ) async {

    emit(state.copyWith(connectionStatus: event.status));

  }

  Future startFollowingConnectivity(StartFollowingConnectivity event, Emitter emit ) async {
    connectivityStreamSubscription = _connectivitySubscription().listen((event) {
      add(ChangeStatus(event));
      add(InternetAccess(event));
     });
  }

  Future<void> internetAccess(InternetAccess event, Emitter emit) async {
    List<InternetAddress> internetAddress = [];
    if ([ConnectivityResult.mobile, ConnectivityResult.wifi].contains(event.connectivity)) {
      internetAddress = await InternetAddress.lookup("www.google.com", type: InternetAddressType.IPv4);
    }
    if (internetAddress.isNotEmpty) {
      emit(state.copyWith(internetAccess: true));
      return;
    }
    emit(state.copyWith(internetAccess: false));

  }

    @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    _connectivityUnSubscription();
    return super.close();
  }
  
}
