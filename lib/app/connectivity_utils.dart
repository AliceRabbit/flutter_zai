import 'package:connectivity_plus/connectivity_plus.dart';

/// Chooses the connection that best represents how app traffic will leave the
/// device when the platform reports multiple active transports.
ConnectivityResult primaryConnectivityResult(
  Iterable<ConnectivityResult> results,
) {
  final activeResults = results.toSet();
  if (activeResults.isEmpty ||
      (activeResults.length == 1 &&
          activeResults.contains(ConnectivityResult.none))) {
    return ConnectivityResult.none;
  }

  const priority = [
    ConnectivityResult.ethernet,
    ConnectivityResult.wifi,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.bluetooth,
    ConnectivityResult.other,
  ];
  for (final result in priority) {
    if (activeResults.contains(result)) {
      return result;
    }
  }
  return ConnectivityResult.none;
}
