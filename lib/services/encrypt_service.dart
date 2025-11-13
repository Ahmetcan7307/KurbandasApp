import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

class EncryptService {
  static const String Salt = "", Key = "";

  /// Encrypts a string using AES encryption with PBKDF2 key derivation.
  Future<String> encryptMap(Map<String, dynamic> map) async {
    if (map.isEmpty) throw Exception("Json cannot be empty.");

    return encrypt.Encrypter(encrypt.AES(
            encrypt.Key(Uint8List.fromList(await _createKey(Key, 32))),
            mode: encrypt.AESMode.cbc))
        .encrypt(map.convertJson(),
            iv: encrypt.IV(Uint8List.fromList(await _createKey(Key, 16))))
        .base64;
  }

  /// Derives a key of specified length from password using PBKDF2 (SHA256)
  Future<List<int>> _createKey(
          String key, int length) async =>
      await (await Pbkdf2(
                  macAlgorithm: Hmac.sha256(),
                  iterations: 10000,
                  bits: length * 8)
              .deriveKey(
                  secretKey: SecretKey(utf8.encode(key)),
                  nonce: utf8.encode(Salt)))
          .extractBytes();
}
