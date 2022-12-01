part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ChangeStatus extends ConnectivityEvent {
  final ConnectivityResult status;

  const ChangeStatus(this.status);
}

class StartFollowingConnectivity extends ConnectivityEvent {}

class InternetAccess extends ConnectivityEvent {
  final ConnectivityResult connectivity;

  const InternetAccess(this.connectivity);

}
