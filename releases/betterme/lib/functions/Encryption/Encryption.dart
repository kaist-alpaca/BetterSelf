import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart';
import "package:pointycastle/export.dart";
import 'package:crypto/crypto.dart';

import 'package:betterme/functions/Encryption/rsa_key.dart';

class Encryption {
  // static Future<SecretBox> encrypt({required String text}) async {
  //   final plainText = utf8.encode(text);
  //   final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256());
  //   final key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  //   final secretKey = SecretKey(key);
  //   final nonce = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  //   // Encrypt
  //   final secretBox = await algorithm.encrypt(
  //     plainText,
  //     secretKey: secretKey,
  //     nonce: nonce,
  //   );
  //   // print('Nonce: ${secretBox.nonce}');
  //   // print('Ciphertext: ${secretBox.cipherText}');
  //   // print('MAC: ${secretBox.mac.bytes}');
  //   return secretBox;
  // }

  // static Future<String> decrypt({required SecretBox secretBox}) async {
  //   final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256());
  //   final key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  //   final secretKey = SecretKey(key);
  //   final clearText = await algorithm.decrypt(
  //     secretBox,
  //     secretKey: secretKey,
  //   );
  //   // print(utf8.decode(clearText));
  //   return utf8.decode(clearText);
  // }

  static String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(26) + 65;
    });

    return new String.fromCharCodes(codeUnits);
  }

  static Future<List<Object>> create_aes_key() async {
    final key = Key.fromUtf8(_randomString(32)); //32 chars
    final key_list = [key, utf8.decode(key.bytes)];
    return key_list;
  }

  static Future<List<String>> encrypt({required String text}) async {
    final key = Key.fromUtf8(_randomString(32)); //32 chars
    final iv = IV.fromUtf8('helloworldhellow'); //16 chars
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    final key_string = utf8.decode(key.bytes);
    final encrypted_list = [encrypted.base64, key_string];
    print('key : $key_string');
    // print('text : $text');
//   print('encrypted : ${encrypted.base64}');
    return encrypted_list;
  }

  static Future<String> encrypt_aes(
      {required String text, required var key}) async {
    try {
      // final key = Key.fromUtf8(_randomString(32)); //32 chars
      // final key = Key.fromUtf8('MySecretKeyForEncryptionAndDecry'); //32 chars
      // final key = Key.fromUtf8(32); //32 chars
      final iv = IV.fromUtf8('helloworldhellow'); //16 chars
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(text, iv: iv);
      final key_string = key.bytes;
      // print('key : $key_string');
      // print(utf8.decode(key_string));
      // print('text : $text');
//   print('encrypted : ${encrypted.base64}');
      return encrypted.base64;
    } catch (e) {
      return '0';
    }
  }

  static Future<String> encrypt_aes_json_encoded(
      {required String text, required var key}) async {
    try {
      var encrypt_aes_json_encoded = await encrypt_aes(text: text, key: key);
      encrypt_aes_json_encoded = json.encode(encrypt_aes_json_encoded);
      return encrypt_aes_json_encoded;
    } catch (e) {
      return '0';
    }
  }

  static Future<String> decrypt_aes(
      {required String text, required var key}) async {
    try {
      final iv = IV.fromUtf8('helloworldhellow'); //16 chars
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final decrypted = encrypter.decrypt64(text, iv: iv);
      return decrypted;
    } catch (e) {
      return '0';
    }
  }

  static Future<String> encrypt_rsa({required var text}) async {
    // final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
    final publicKey = RSAKeyParser().parse(rsa_key.public_key) as RSAPublicKey;
    // final privKey = RSAKeyParser().parse(rsa_key.private_key) as RSAPrivateKey;
    // final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');

    // final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    final encrypted = encrypter.encrypt(text);
    // final decrypted = encrypter.decrypt(encrypted);

    // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    // print(encrypted.base64);
//   print('text : $text');
//   print('encrypted : ${encrypted.base64}');
    return encrypted.base64;
  }

  static Future<String> encrypt_sha({required var text}) async {
    var result = sha256.convert(utf8.encode(text)).toString();

    // result = json.encode(result);

    return result;
  }

  static String encrypt_sha_new({required var text}) {
    var result = sha256.convert(utf8.encode(text)).toString();

    // result = json.encode(result);

    return result;
  }
}
