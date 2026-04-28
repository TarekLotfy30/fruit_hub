import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  final List<ConnectivityResult> _connectionStatus = [
    ConnectivityResult.wifi,
    ConnectivityResult.mobile,
    ConnectivityResult.ethernet,
  ];

  Future<bool> isInternetConnected() async {
    final connectivity = await Connectivity().checkConnectivity();

    return _connectionStatus.contains(connectivity);
  }
}
