import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNet {
  CheckNet._internal();

//Singleton object
  static final CheckNet _instance = CheckNet._internal();
  factory CheckNet() => _instance;

  final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();
  Stream<bool> get connectStream => _streamController.stream;

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return _updateConnectivityResult(connectivityResult);
  }

  bool _updateConnectivityResult(List<ConnectivityResult> result) {
    bool isConnected = false;
    for (var data in result) {
      if (data == ConnectivityResult.mobile ||
          data == ConnectivityResult.wifi) {
        isConnected = true;
      }
    }
    _streamController.add(isConnected);
    print(isConnected);
    return isConnected;
  }

  init() {
    _connectivity.onConnectivityChanged
        .listen((event) => _updateConnectivityResult(event));
  }

  dispose() {
    _streamController.close();
  }
}
