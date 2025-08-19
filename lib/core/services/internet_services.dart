import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

typedef InternetRestoredCallback = FutureOr<void> Function();

class InternetService {

  factory InternetService() => _instance;

  InternetService._internal();
  static final InternetService _instance = InternetService._internal();

  final ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);
  final Set<InternetRestoredCallback> _callbacks = {};

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _isInitialized = false;

  /// Initializes connectivity listener
  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;

    await _checkInitialConnection();

    _subscription = Connectivity().onConnectivityChanged.listen((resultList) {
      final firstResult = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      _handleConnectionChange(firstResult);
    });
  }

  /// Checks the initial connection status
  Future<void> _checkInitialConnection() async {
    final resultList = await Connectivity().checkConnectivity();
    final firstResult = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    _handleConnectionChange(firstResult);
  }

  /// Handles connection updates and triggers callbacks if needed
  void _handleConnectionChange(ConnectivityResult result) {
    final hasConnection = result != ConnectivityResult.none;

    if (isConnected.value != hasConnection) {
      isConnected.value = hasConnection;

      if (hasConnection) {
        _triggerCallbacks();
      }
    }
  }

  /// Registers a callback to run when internet is restored
  void registerCallback(InternetRestoredCallback callback) {
    _callbacks.add(callback);
  }

  /// Unregisters a previously added callback
  void unregisterCallback(InternetRestoredCallback callback) {
    _callbacks.remove(callback);
  }

  /// Triggers all registered callbacks
  Future<void> _triggerCallbacks() async {
    for (final callback in _callbacks) {
      await callback();
    }
  }

  /// Disposes listeners and resets state
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _callbacks.clear();
    isConnected.dispose();
    _isInitialized = false;
  }

  /// Returns the current internet status
  bool get currentStatus => isConnected.value;
}
