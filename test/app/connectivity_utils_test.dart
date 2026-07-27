import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:zaix/app/connectivity_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('primaryConnectivityResult', () {
    test('treats an empty result and none as offline', () {
      expect(primaryConnectivityResult(const []), ConnectivityResult.none);
      expect(
        primaryConnectivityResult(const [ConnectivityResult.none]),
        ConnectivityResult.none,
      );
    });

    test('prefers a non-metered transport over mobile and VPN', () {
      expect(
        primaryConnectivityResult(const [
          ConnectivityResult.mobile,
          ConnectivityResult.vpn,
          ConnectivityResult.wifi,
        ]),
        ConnectivityResult.wifi,
      );
      expect(
        primaryConnectivityResult(const [
          ConnectivityResult.mobile,
          ConnectivityResult.ethernet,
        ]),
        ConnectivityResult.ethernet,
      );
    });

    test('keeps mobile as primary when VPN is layered over cellular', () {
      expect(
        primaryConnectivityResult(const [
          ConnectivityResult.vpn,
          ConnectivityResult.mobile,
        ]),
        ConnectivityResult.mobile,
      );
    });
  });
}
