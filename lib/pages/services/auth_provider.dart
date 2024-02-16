// Service para verificar a disponibilidade da biometria no smartphone e usá-la como método de autenticação/login

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true, useErrorDialogs: true),
        authMessages: <AuthMessages>[
          const AndroidAuthMessages(signInTitle: 'Guarda Dados', biometricHint: '', cancelButton: 'Cancelar')
        ],
        localizedReason: 'Desbloqueie seu celular',
      );
    } on PlatformException {
      return false;
    }
  }
}
