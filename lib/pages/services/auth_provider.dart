// Service para verificar a disponibilidade da biometria no smartphone e usá-la como método de autenticação/login

import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
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
        biometricOnly: true,
        localizedReason: 'Desbloqueie seu celular',
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: const AndroidAuthMessages(signInTitle: 'Guarda Dados', biometricHint: '', cancelButton: 'Cancelar'),
      );
    } on PlatformException {
      return false;
    }
  }
}
