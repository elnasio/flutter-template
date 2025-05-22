import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Stream<bool> get onStatusChanged => connectivity.onConnectivityChanged.map((status) => status != ConnectivityResult.none);
}
