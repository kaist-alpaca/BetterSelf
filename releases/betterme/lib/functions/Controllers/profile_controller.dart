import 'dart:io';
import 'package:betterme/functions/Encryption/Encryption.dart';
import 'package:betterme/functions/Encryption/rsa_key.dart';
import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:fast_rsa/model/bridge_model_generated.dart';
import 'package:get/get.dart';
import 'package:fast_rsa/fast_rsa.dart' as fast_rsa;

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

import 'TypeUserModel.dart';

import 'image_crop_controller.dart';

import 'server_connection.dart';

enum ProfileImageType { THUMBNAIL, BACKGROUND }

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool isEditMyProfile = false.obs;
  UserModel originMyProfile = UserModel();
  Rx<UserModel> myProfile = UserModel().obs;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime reportDay = DateTime.now();

  // double weightProfile = 0;

  DateTime date = DateTime.now();

  int buttonCase = 0;

  File? food;

  //buttonCase 관련
  void buttonCaseZero() {
    buttonCase = 0;
    update();
  }

  void buttonCaseOne() {
    buttonCase = 1;
    update();
  }

  void buttonCaseTwo() {
    buttonCase = 2;
    update();
  }

  void buttonCaseThree() {
    buttonCase = 3;
    update();
  }

  //Day 관련

  void updatefocusedDay(DateTime value) {
    focusedDay = value;
    update();
  }

  void updateselectedDay(DateTime value) {
    selectedDay = value;
    update();
  }

  void dateMinus(DateTime value) {
    date = date.subtract(Duration(days: 1));
    update();
  }

  void dateMinus7(DateTime value) {
    date = date.subtract(Duration(days: 7));
    update();
  }

  void rdateMinus7(DateTime value) {
    reportDay = reportDay.subtract(Duration(days: 7));
    update();
  }

  void datePlus(DateTime value) {
    date = date.add(Duration(days: 1));
    update();
  }

  void datePlus7(DateTime value) {
    date = date.add(Duration(days: 7));
    update();
  }

  void rdatePlus7(DateTime value) {
    reportDay = reportDay.add(Duration(days: 7));
    update();
  }

  void dateReset(DateTime value) {
    date = DateTime.now();
    update();
  }

  void reportDayReset(DateTime value) {
    reportDay = DateTime.now();
    update();
  }

  void updateReport(DateTime value) {
    reportDay = value;
    update();
  }

  int total_graph_type = 0;
  void updatetotal_graph_type(int n) {
    if (total_graph_type == n || total_graph_type != 0) {
      ServerConnection.write_log('ReportScreen', 'graph_area_all', '');
      total_graph_type = 0;
    } else {
      total_graph_type = n;
    }
    update();
  }

  int duration = 7;
  DateTime totaldate = DateTime.now();
  List<dynamic> datelist = [
    DateTime.now().toString().substring(0, 10).replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -1))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -2))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -3))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -4))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -5))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -6))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
  ];

  int initalDatelist(int n) {
    if (duration == n) {
      return 1;
    }
    duration = n;
    totaldate = DateTime.now();
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
    return 1;
  }

  void minusDatelist(int duration) {
    totaldate = totaldate.add(Duration(days: -duration));
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
  }

  void plusDatelist(int duration) {
    totaldate = totaldate.add(Duration(days: duration));
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
  }

  // void updateWeight(double value) {
  //   weightProfile = value;
  //   update();
  // }

//일주일전까지구하기
  DateTime MinusSevenDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 7);
  }

  DateTime MinusSixDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 6);
  }

  DateTime MinusFiveDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 5);
  }

  DateTime MinusFourDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 4);
  }

  DateTime MinusThreeDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 3);
  }

  DateTime MinusTwoDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 2);
  }

  DateTime MinusOneDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 1);
  }

//일주일구하기
  DateTime startDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - (date.weekday - 1));
  }

  DateTime endDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + (7 - date.weekday));
  }

  DateTime TueDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 1 - (date.weekday - 1));
  }

  DateTime WedDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 2 - (date.weekday - 1));
  }

  DateTime ThuDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 3 - (date.weekday - 1));
  }

  DateTime FriDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 4 - (date.weekday - 1));
  }

  DateTime SatDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 5 - (date.weekday - 1));
  }

  // 홈화면용 어제/그제 구하기
  DateTime YYDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 2);
  }

  DateTime YDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 1);
  }

  int foodindex = 1;

  String food1 = "";
  String food2 = "";
  String food3 = "";

  String? gender = "선택안함";
  String? birthday = '2002/06/21';
  String? weightday = DateTime.now().toString().substring(0, 10);
  String? height = '';
  String weight = '0.0';
  var weight_test = RxString('');
  String? disease = '';

  void foodindexSelected(int value) {
    foodindex = value;
    update();
  }

  void foodiSelected(int index, String value) {
    if (index == 1) {
      food1 = value;
    } else if (index == 2) {
      food2 = value;
    } else {
      food3 = value;
    }
    update();
  }

  void genderSelected(String value) {
    gender = value;
    update();
  }

  void birthdaySelected(String value) {
    birthday = value;
    update();
  }

  void weightdaySelected(String value) {
    weightday = value;
    update();
  }

  void heightSelected(String value) {
    height = value;
    update();
  }

  void weightSelected(String value) {
    weight = value;
    update();
  }

  void diseaseSelected(String value) {
    disease = value;
    update();
  }

  Future<String> authStateChanges(Object? firebaseUser) async {
    print("authStateChanges working");
    String tmp = "0";
    if (firebaseUser != null) {
      UserModel? userModel = await ServerConnection.findUserByUid(
          FirebaseAuth.instance.currentUser!.uid);
      if (userModel != null) {
        print("usermodel is not null");
        originMyProfile = userModel;
      } else {
        tmp = "1";
        // await FirebaseAuth.instance.signOut();
        print("usermodel is null");
        if (FirebaseAuth.instance.currentUser!.displayName != null &&
            FirebaseAuth.instance.currentUser!.photoURL != null) {
          await ServerConnection.uploadProfileImage(
            FirebaseAuth.instance.currentUser!.uid,
            FirebaseAuth.instance.currentUser!.photoURL!,
          );
        } else {
          print('sign with apple');
          print(FirebaseAuth.instance.currentUser!);
          await FirebaseAuth.instance.currentUser!.updateDisplayName('닉네임');
          await FirebaseAuth.instance.currentUser!.updatePhotoURL(
              'http://kaistuser.iptime.org:8080/img/profile.png');
          // FirebaseAuth.instance.currentUser!.displayName = 'testting';
          await ServerConnection.uploadProfileImage(
            FirebaseAuth.instance.currentUser!.uid,
            'http://kaistuser.iptime.org:8080/img/profile.png',
          );
          print(FirebaseAuth.instance.currentUser!);
        }
        print("create user");
        print(FirebaseAuth.instance.currentUser!.uid);
        print(FirebaseAuth.instance.currentUser!.email!);
        print(FirebaseAuth.instance.currentUser!.displayName!);

        await ServerConnection.createUser(
          FirebaseAuth.instance.currentUser!.uid,
          FirebaseAuth.instance.currentUser!.email!,
          FirebaseAuth.instance.currentUser!.displayName!,
        );
        originMyProfile = UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: FirebaseAuth.instance.currentUser!.displayName,
          email: FirebaseAuth.instance.currentUser!.email,
          profileUrl: "http://kaistuser.iptime.org:8080/img/profile/" +
              FirebaseAuth.instance.currentUser!.uid +
              ".jpg",
        );
      }
    }
    myProfile(UserModel.clone(originMyProfile));

    await ServerConnection.updateHeathData(
        FirebaseAuth.instance.currentUser!.uid);

    var weight = await ServerConnection.GetWeight(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (weight["result"] != '0') {
      weightSelected(weight["result"][0]["weight"]);
    }

    var birth = await ServerConnection.GetBirthDay(
        FirebaseAuth.instance.currentUser!.uid);
    birthdaySelected(birth);

    var disease = await ServerConnection.GetDisease(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (disease != '0') {
      diseaseSelected(disease);
    }

    var gender = await ServerConnection.GetGender(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (gender != '0') {
      genderSelected(gender);
    }

    var height = await ServerConnection.GetHeight(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (height != '0') {
      heightSelected(height);
    }

    ServerConnection.write_log('login', '', '');

    // return FirebaseAuth.instance.currentUser == null
    //     ? ''
    //     : FirebaseAuth.instance.currentUser!.uid;
    return tmp;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage({required String type, required String use}) async {
    File? file = type == "gallery"
        ? await ImageCropController.to.selectImage(type: 'gallery')
        : await ImageCropController.to.selectImage(type: 'camera');
    food = null;
    if (file == null) {
      update();
      return;
    }
    if (use == "profile") {
      myProfile.update((my) => my?.profileImage = file);
    } else {
      food = file;
      update();
    }
  }

  void _updateProfileImageUrl(String downloadUrl) {
    originMyProfile.profileUrl = downloadUrl;
    myProfile.update((user) => user!.profileUrl = downloadUrl);
    print("update working???");
    print(originMyProfile.profileUrl);
    print(myProfile.value.profileUrl);
  }

  Future<int> save() async {
    originMyProfile = myProfile.value;
    if (originMyProfile.profileImage != null) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(originMyProfile.profileImage!.openRead()));
      var length = await originMyProfile.profileImage!.length();

      var uri = Uri.parse("http://kaistuser.iptime.org:8080/profile.php?uid=" +
          originMyProfile.uid! +
          "&type=profile");

      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('imgFile', stream, length,
          filename: basename(originMyProfile.profileImage!.path));

      request.files.add(multipartFile);
      var response = await request.send();
      print(response.statusCode);
      print(originMyProfile.uid!);
      print(originMyProfile.profileImage!.length());
      String tmp = "@@@";
      response.stream.transform(utf8.decoder).listen((value) {
        print("!!!!!!!!!");
        print(value);
        tmp = value;
      });
      _updateProfileImageUrl("http://kaistuser.iptime.org:8080/img/profile/" +
          originMyProfile.uid! +
          ".jpg");
    }
    return 123121;
  }

  Future<String> uploadFoodImage(
      {required String uid, required File file, required String time}) async {
    print("food start");
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print(length);
    var uri = Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_food_image.php?uid=" +
            uid +
            "&photoURL=" +
            time);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('imgFile', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);

    String tmp = "@@@";
    response.stream.transform(utf8.decoder).listen((value) {
      print("!!!!!!!!!");
      print(value);
      tmp = value;
    });

    return tmp;
  }

  Future<bool> updateProfile() async {
    print('gender');
    print(gender);
    print(birthday);
    print(height);
    print(disease == '');
    print(originMyProfile.uid);

    // final key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    // // 1회용 키
    // final nonce = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    // // 인증용 데이터
    // final aad = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

    // // 암호화할 데이터
    // // final plainText = [1, 2, 3];
    // final plainText = utf8.encode(originMyProfile.uid!);

    // // AES GCM 128 알고리즘 사용
    // final algorithm = AesGcm.with128bits();

    // // 키를 SecretKey로 생성
    // final secretKey = SecretKey(key);

    // // 암호화!
    // final secretBox = await algorithm.encrypt(plainText,
    //     secretKey: secretKey, nonce: nonce, aad: aad);

    // // 암호화된 데이터
    // print('Ciphertext: ${secretBox.cipherText}');
    // // 암호화된 유효성 검사용 MAC 데이터
    // print('MAC: ${secretBox.mac}');

    // var decryptedData = <int>[];
    // try {
    //   // 복호화
    //   decryptedData = await algorithm.decrypt(
    //     secretBox,
    //     secretKey: secretKey,
    //     aad: aad,
    //   );
    // } catch (e) {
    //   print('decryption error: $e');
    // } finally {
    //   //복호화 성공시!
    //   print('decryptedData: $decryptedData');
    //   print(utf8.decode(decryptedData));
    //   // print(utf16.decode(decryptedData));
    // }

    // final plainText = utf8.encode(originMyProfile.uid!);
    // final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256());
    // final key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    // final secretKey = SecretKey(key);
    // final nonce = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

    // // Encrypt
    // final secretBox = await algorithm.encrypt(
    //   plainText,
    //   secretKey: secretKey,
    //   nonce: nonce,
    // );
    // print('Nonce: ${secretBox.nonce}');
    // print('Ciphertext: ${secretBox.cipherText}');
    // print('MAC: ${secretBox.mac.bytes}');

    // // Decrypt
    // final clearText = await algorithm.decrypt(
    //   secretBox,
    //   secretKey: secretKey,
    // );
    // print('Cleartext: $clearText');
    // print(utf8.decode(clearText));

    // var secretBox = await Encryption.encrypt(text: originMyProfile.uid!);
    // print('Nonce: ${secretBox.nonce}');
    // print('Ciphertext: ${secretBox.cipherText}');
    // // print(utf8.decode(secretBox.cipherText));
    // print('MAC: ${secretBox.mac.bytes}');

    // var clearText = await Encryption.decrypt(secretBox: secretBox);
    // print('Cleartext: $clearText');

    // secretBox = await Encryption.encrypt(text: gender!);
    // print('Nonce: ${secretBox.nonce}');
    // print('Ciphertext: ${secretBox.cipherText}');
    // print('MAC: ${secretBox.mac.bytes}');

    // clearText = await Encryption.decrypt(secretBox: secretBox);
    // print('Cleartext: $clearText');

    // secretBox = await Encryption.encrypt(text: birthday!);
    // print('Nonce: ${secretBox.nonce}');
    // print('Ciphertext: ${secretBox.cipherText}');
    // print('MAC: ${secretBox.mac.bytes}');

    // clearText = await Encryption.decrypt(secretBox: secretBox);
    // print('Cleartext: $clearText');

    // secretBox = await Encryption.encrypt(text: height!);
    // print('Nonce: ${secretBox.nonce}');
    // print('Ciphertext: ${secretBox.cipherText}');
    // print('MAC: ${secretBox.mac.bytes}');

    // final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

    // final key = Key.fromLength(32);
    // final iv = IV.fromLength(16);
    // final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // final encrypted = encrypter.encrypt(plainText, iv: iv);
    // final decrypted = encrypter.decrypt(encrypted, iv: iv);

    // print(encrypted.bytes);
    // print(encrypted.base16);
    // print(encrypted.base64);
    // print(decrypted);

    // final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');

    // print(rsa_key.public_key);

    // var result = await fast_rsa.RSA.encryptOAEP(
    //     "message", "cute_alpaca", fast_rsa.Hash.SHA256, rsa_key.public_key);
    // // var result2 = await fast_rsa.RSA.decryptOAEP(
    // //     result, "cute_alpaca", fast_rsa.Hash.SHA256, rsa_key.private_key);
    // var result2 = await fast_rsa.RSA.generate(2048);
    // print(result2.privateKey);
    // print(result2.publicKey);
    // print(rsa_key.pub);
    // // print(rsa_key.public_key);
    // result = await fast_rsa.RSA.encryptOAEP(
    //     "message", "cute_alpaca", fast_rsa.Hash.SHA256, result2.publicKey);
    // var result3 = await fast_rsa.RSA.decryptOAEP(
    //     result, "cute_alpaca", fast_rsa.Hash.SHA256, result2.privateKey);
    // print(result3);

    // result = await fast_rsa.RSA.encryptOAEP("messagedsfdsf", "cute_alpaca",
    //     fast_rsa.Hash.SHA256, rsa_key.public_key);
    // // result3 = await fast_rsa.RSA.decryptOAEP(
    // //     result, "cute_alpaca", fast_rsa.Hash.SHA256, rsa_key.private_key);
    // print(result);
    // var result4 = await fast_rsa.RSA.base64(result);
    // print(result4);
    // result = await fast_rsa.RSA.encryptOAEP(
    //     "message", "cute_alpaca", fast_rsa.Hash.SHA256, rsa_key.public_key);
    // print(result);
    // var result =
    //     await fast_rsa.RSA.encryptPKCS1v15("message", rsa_key.public_key);
    // var result = await fast_rsa.RSA.base64("message");

    // final signer = Signer(RSASigner(RSASignDigest.SHA256, publicKey: rsa_key.public_key));

    // var result = await Encryption.encrypt_aes(text: "알파카 테스트");
    // print(result);

    // result = await Encryption.encrypt_rsa(text: "알파카");
    // print(result);

    // var result = await Encryption.encrypt(text: "알파카 테스트");

    // print(result[0]);
    // print(result[1]);

    // await Encryption.encrypt_rsa(text: result[1]);

    // final signer = Signer(RSASigner(RSASignDigest.SHA256, publicKey: rsa_key.public_key));

    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    var data = [];

    for (int i = 0; i < 4; i++) {
      var map = {};
      map['startDate'] =
          await Encryption.encrypt_aes(text: '2021_12_13', key: key_list[0]);
      map['data'] =
          await Encryption.encrypt_aes(text: i.toString(), key: key_list[0]);
      data.add(map);
    }

    var data_string = json.encode(List.from(data.reversed));
    print(data_string);

    var data_string_encode =
        await Encryption.encrypt_aes(text: data_string, key: key_list[0]);
    print(data_string_encode);
    var decryption_test = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/decryption_test_with_flutter.php?aes_key_encrypt_rsa=" +
            json.encode(aes_key_encrypt_rsa) +
            "&data=" +
            json.encode(data_string_encode)));
    print(json.decode(decryption_test.body));

    var sha_test = await Encryption.encrypt_sha(text: "alpaca");

    print(sha_test);

    ServerConnection.updateHeathData(originMyProfile.uid!);

    // print('aes_key_encrypt_rsa : $aes_key_encrypt_rsa');

    // var result = await Encryption.encrypt_aes(text: disease!, key: key_list[0]);
    // print('result : $result');

    final uid_encrypt = await Encryption.encrypt_aes(
        text: originMyProfile.uid!, key: key_list[0]);
    final gender_encrypt =
        await Encryption.encrypt_aes(text: gender!, key: key_list[0]);
    final birthday_encrypt =
        await Encryption.encrypt_aes(text: birthday!, key: key_list[0]);
    final height_encrypt =
        await Encryption.encrypt_aes(text: height!, key: key_list[0]);
    final disease_encrypt =
        await Encryption.encrypt_aes(text: disease!, key: key_list[0]);

    final response = disease == ''
        ? await http.get(Uri.parse(
            "http://kaistuser.iptime.org:8080/update_profile.php?uid=" +
                json.encode(uid_encrypt) +
                '&gender=' +
                json.encode(gender_encrypt) +
                '&birthday=' +
                json.encode(birthday_encrypt) +
                '&height=' +
                json.encode(height_encrypt) +
                '&aes_key_encrypt_rsa=' +
                json.encode(aes_key_encrypt_rsa)))
        : await http.get(Uri.parse(
            "http://kaistuser.iptime.org:8080/update_profile.php?uid=" +
                json.encode(uid_encrypt) +
                '&gender=' +
                json.encode(gender_encrypt) +
                '&birthday=' +
                json.encode(birthday_encrypt) +
                '&height=' +
                json.encode(height_encrypt) +
                '&disease=' +
                json.encode(disease_encrypt) +
                '&aes_key_encrypt_rsa=' +
                json.encode(aes_key_encrypt_rsa)));
    // print(response.request);
    // print(json.decode(response.body));
    return (json.decode(response.body));
  }

  Future<void> updateName({required String name}) async {
    FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    originMyProfile.name = name;
    myProfile.value.name = name;
    update();
    print('updateName');
    print(name);
    print(originMyProfile.uid);
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);
    print('aes_key_encrypt_rsa : $aes_key_encrypt_rsa');

    // var result = await Encryption.encrypt_aes(text: disease!, key: key_list[0]);
    // print('result : $result');

    final uid_encrypt = await Encryption.encrypt_aes(
        text: originMyProfile.uid!, key: key_list[0]);
    final name_encrypt =
        await Encryption.encrypt_aes(text: name, key: key_list[0]);
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/update_name.php?uid=" +
            json.encode(uid_encrypt) +
            '&name=' +
            json.encode(name_encrypt) +
            '&aes_key_encrypt_rsa=' +
            json.encode(aes_key_encrypt_rsa)));
  }
}
