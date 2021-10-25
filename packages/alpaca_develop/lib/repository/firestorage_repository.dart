import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:async/async.dart';

class FireStorageRepository {
  Future<void> uploadImageFile(String uid, String filename, File file) async {
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();

    var uri = Uri.parse("http://kaistuser.iptime.org:8080/profile.php?uid=" +
        uid +
        "&type=" +
        filename);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('imgFile', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    print(uid);
    print(file.length());
    String tmp = "@@@";
    response.stream.transform(utf8.decoder).listen((value) {
      print("!!!!!!!!!");
      print(value);
      tmp = value;
    });
  }
}
