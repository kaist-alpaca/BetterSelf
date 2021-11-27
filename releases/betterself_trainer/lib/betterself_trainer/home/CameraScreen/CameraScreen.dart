import 'dart:io';

import 'package:betterself_trainer/betterself_trainer/home/SearchFoodScreen/SearchFoodScreen.dart';
import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
// import 'package:thumbnails/thumbnails.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen>
    with AutomaticKeepAliveClientMixin {
  late CameraController _controller;
  // late List<CameraDescription> _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Object?> food_list = [];

  @override
  // void initState() {
  //   _controller = CameraController(Get.arguments[0], ResolutionPreset.max);
  //   _controller.addListener(() {
  //     if (mounted) setState(() {});
  //   });
  //   _controller.initialize();
  //   setState(() {});
  //   super.initState();
  // }

  void initState() {
    super.initState();
    print(Get.arguments[0]);
    _controller = CameraController(Get.arguments[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      extendBody: true,
      body: Stack(
        children: <Widget>[
          _buildCameraPreview(),
          Positioned(
            top: 24.0,
            left: 12.0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.switch_camera,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _onCameraSwitch();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCameraPreview() {
    final size = MediaQuery.of(context).size;
    var a;
    var ratio;
    var ratio_1;
    // if (_controller.value.aspectRatio == null) {
    //   print("null");
    // }
    // print(_controller.value.aspectRatio);
    try {
      print(_controller.value.aspectRatio);
      a = 1;
      ratio = 1 / _controller.value.aspectRatio;
      ratio_1 = ratio / size.aspectRatio;
    } catch (e) {
      print("not working");
      a = 2;
      ratio = 0.75;
      ratio_1 = 1.6;
    }
    print("rebuild");
    print(ratio);
    print(ratio_1);
    print(size.aspectRatio);
    return ClipRect(
      child: Container(
        child: Transform.scale(
          // scale: _controller.value.aspectRatio / size.aspectRatio,
          // scale: 16 / 9,
          scale: 1,
          // scale: ratio_1,
          child: Center(
            child: AspectRatio(
              // aspectRatio: _controller.value.aspectRatio,
              // aspectRatio: 1,
              aspectRatio: ratio,
              child: CameraPreview(_controller),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      height: 100.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // FutureBuilder(
          //   future: getLastImage(),
          //   builder: (context, snapshot) {
          //     if (snapshot.data == null) {
          //       return Container(
          //         width: 40.0,
          //         height: 40.0,
          //       );
          //     }
          //     return GestureDetector(
          //       onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Gallery(),
          //         ),
          //       ),
          //       child: Container(
          //         width: 40.0,
          //         height: 40.0,
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(4.0),
          //           child: Image.file(
          //             snapshot.data,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.0,
            child: IconButton(
              icon: Icon(
                Icons.add_photo_alternate_rounded,
                size: 28.0,
                color: Colors.black,
              ),
              onPressed: () async {
                // _captureImage();
                await ProfileController.to
                    .pickImage(type: 'gallery', use: 'food');
                if (ProfileController.to.food != null) {
                  // ProfileController.to.uploadFoodImage(
                  //     uid: ProfileController.to.myProfile.value.uid!,
                  //     index: '0',
                  //     file: ProfileController.to.food!);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchFoodScreen(),
                  //   ),
                  // );
                  _controller.dispose();
                  Get.off(
                    () => SearchFoodScreen(),
                    arguments: [food_list, ProfileController.to.food],
                  );
                }
              },
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                size: 28.0,
                color: Colors.black,
              ),
              onPressed: () {
                _captureImage();
              },
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.0,
            child: IconButton(
              icon: Icon(
                Icons.food_bank,
                size: 28.0,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.dispose();
                Get.off(
                  () => SearchFoodScreen(),
                  arguments: [food_list, 0],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Future<FileSystemEntity> getLastImage() async {
  //   final Directory extDir = await getApplicationDocumentsDirectory();
  //   final String dirPath = '${extDir.path}/media';
  //   final myDir = Directory(dirPath);
  //   List<FileSystemEntity> _images;
  //   _images = myDir.listSync(recursive: true, followLinks: false);
  //   _images.sort((a, b) {
  //     return b.path.compareTo(a.path);
  //   });
  //   var lastFile = _images[0];
  //   var extension = path.extension(lastFile.path);
  //   if (extension == '.jpeg') {
  //     return lastFile;
  //   } else {
  //     String thumb = await Thumbnails.getThumbnail(
  //         videoFile: lastFile.path, imageType: ThumbFormat.PNG, quality: 30);
  //     return File(thumb);
  //   }
  // }

  Future<void> _onCameraSwitch() async {
    print("camera switch");
    final CameraDescription cameraDescription =
        (_controller.description == Get.arguments[0])
            ? Get.arguments[1]
            : Get.arguments[0];
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _controller.addListener(() {
      if (mounted) setState(() {});
      // if (_controller.value.hasError) {
      //   showInSnackBar('Camera error ${_controller.value.errorDescription}');
      // }
    });

    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _captureImage() async {
    print('_captureImage');
    if (_controller.value.isInitialized) {
      SystemSound.play(SystemSoundType.click);
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/media';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${_timestamp()}.jpeg';
      // print('path: $filePath');
      // await _controller.takePicture(filePath);
      XFile tmp = await _controller.takePicture();
      print(tmp.path);
      // ProfileController.to.uploadFoodImage(
      //     uid: ProfileController.to.myProfile.value.uid!,
      //     index: '0',
      //     file: File(tmp.path));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SearchFoodScreen()));
      Get.off(
        () => SearchFoodScreen(),
        arguments: [food_list, File(tmp.path)],
      );
    }
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  // void _showCameraException(CameraException e) {
  //   logError(e.code, e.description);
  //   showInSnackBar('Error: ${e.code}\n${e.description}');
  // }

  // void showInSnackBar(String message) {
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  // }

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  @override
  bool get wantKeepAlive => true;
}
