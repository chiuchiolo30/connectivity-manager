part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  final ConnectivityResult _connectionStatus;
  final bool _internetAccess;
  
  const ConnectivityState({ ConnectivityResult? connectionStatus, bool? internetAccess }) 
    : _connectionStatus = connectionStatus ?? ConnectivityResult.none,
      _internetAccess = internetAccess ?? false;
  
  ConnectivityResult get connectionStatus => _connectionStatus;
  bool get internetAccess => _internetAccess;

  ConnectivityState copyWith({ ConnectivityResult? connectionStatus, bool? internetAccess }) => ConnectivityState( connectionStatus: connectionStatus ?? _connectionStatus, internetAccess: internetAccess ?? _internetAccess );

  @override
  List<Object> get props => [_connectionStatus, _internetAccess];
}


