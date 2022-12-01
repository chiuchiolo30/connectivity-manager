import 'package:connectivity_plus/connectivity_plus.dart' show ConnectivityResult;
import 'package:flutter/widgets.dart' show IconData;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

enum Processed {
  guia('Guias procesadas'),
  receptor('Guias procesadas');

  const Processed(this.dato);
  final String dato;
}

const Map<bool, String> internetAccess = { true: "Hay acceso a internet", false: "No hay acceso a internet"};
const Map<ConnectivityResult, IconData> connectivity   = { ConnectivityResult.wifi: FontAwesomeIcons.wifi, ConnectivityResult.mobile: FontAwesomeIcons.mobile};